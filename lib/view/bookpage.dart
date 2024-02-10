import 'dart:convert';
import 'dart:developer';
import 'package:bookbytes/models/user.dart';
import 'package:bookbytes/view/bookdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/books.dart';
import '../models/util/Myservercofig.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class homePage extends StatefulWidget {
  final User userdata;
  const homePage({super.key, required this.userdata});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Book> bookList = <Book>[];
  late double screenWidth, screenHeight;
  int numofpage = 1;
  int curpage = 1;
  int numofresult = 0;

  TextEditingController searchctlr = TextEditingController();

  var color;
  String title = " ";

  @override
  void initState() {
    super.initState();
    loadBooks(title);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Text("BookBytes"),
        centerTitle: true,
      ),
      body: LiquidPullToRefresh(
        color: Colors.blueGrey,
        onRefresh: () async {
          loadBooks(title);
        },
        child: bookList.isEmpty ? 
        Center(
          child: Text("No data found"),
        )
         : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.grey), // Add an outline
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: searchctlr,
                        onChanged: (text){
                          title = text;
                          loadBooks(title);
                        },
                        
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    )),
                // SizedBox(
                //   height: 10,
                // ),
                // InkWell(
                //   onTap: () {
                //     // Handle tap event here
                //     print('Container tapped!');
                //   },
                //   child: Container(
                //     width: 350.0, // Set your desired width
                //     height: 100.0, // Set your desired height
                //     color: Colors.blue, // Set your desired color
                //     child: Center(
                //       child: Text(
                //         'Latest Book',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 18.0,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Make a scrollable row of placeholder filter buttons
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  height: 35.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildFIlterButton("Filter"),
                      // buildFIlterButton("Pilter"),
                      // buildFIlterButton("Bilter"),
                    ],
                  ),
                ),
                Container(
                  height: 312,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: bookList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            Book book = Book.fromJson(bookList[index].toJson());
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (content) => BookDetails(
                                  user: widget.userdata,
                                  book: book,
                                ),
                              ),
                            );
                            loadBooks(title);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                child: Image.network(
                                  "${MyServerConfig.server}/bookbytes/assets/${bookList[index].bookId}.png",
                                  fit: BoxFit.cover,
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      truncateString(bookList[index].bookTitle.toString()),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "RM ${bookList[index].bookPrice}",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${bookList[index].bookQty} unit",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          if (curpage > 1) {
                            curpage--;
                            loadBooks(title);
                          }
                        },
                        child: const Text("Prev"),
                      ),
                    ),
                    Text(
                        curpage.toString() + "/" + numofpage.toString() + " pages"),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          if (curpage < numofpage) {
                            curpage++;
                            loadBooks(title);
                          }
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Buat Button
  Padding buildFIlterButton(String textToInsert) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)))),
        onPressed: () {/* Put your code here */},
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            textToInsert,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  String truncateString(String str) {
    if (str.length > 20) {
      str = str.substring(0, 20);
      return "$str...";
    } else {
      return str;
    }
  }

  void loadBooks(String title) {
    http
        .get(
      Uri.parse(
          "${MyServerConfig.server}/bookbytes/php/loadbooks.php?title=$title&pageno=$curpage"),
    )
        .then((response) {
      //log(response.body);
      if (response.statusCode == 200) {
        //log(response.body);
        var data = jsonDecode(response.body);
        if (data['status'] == "success") {
          bookList.clear();
          data['data']['books'].forEach((v) {
            bookList.add(Book.fromJson(v));
          });
          numofpage = int.parse(data['numofpage'].toString());
          numofresult = int.parse(data['numberofresult'].toString());
        } else {
          //if no status failed
        }
      }
      setState(() {});
    });
  }

  void showSearchDialog() {
    TextEditingController searchctlr = TextEditingController();
    title = searchctlr.text;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            title: const Text(
              "Search Title",
              style: TextStyle(),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: searchctlr,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    loadBooks(searchctlr.text);
                  },
                  child: const Text("Search"),
                )
              ],
            ));
      },
    );
  }
}
