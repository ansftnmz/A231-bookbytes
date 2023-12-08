import 'dart:convert';

import 'package:bookbytes/shared/registerpage.dart';
import 'package:bookbytes/models/util/Myservercofig.dart';
import 'package:bookbytes/view/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    loadpref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset('assets/images/login.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center),
          Container(
            padding: EdgeInsets.only(left: 35, top: 130),
            child: Text(
              'Welcome\nto BookBytes',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 33,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(children: [
                        TextFormField(
                          controller: _emailditingController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _passEditingController,
                          style: TextStyle(),
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),

                        //Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value) {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                saveremovepref(value!);
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            const Text("Remember Me"),
                          ]),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              style: ButtonStyle(),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    _loginUser();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     // TextButton(
                        //     //  onPressed: () {},
                        //     // child: Text(
                        //     //  'Forgot Password',
                        //     //  style: TextStyle(
                        //     //    decoration: TextDecoration.underline,
                        //     //     color: Color(0xff4c505b),
                        //     //      fontSize: 18,
                        //     //    ),
                        //     //  )),
                        //   ],
                        // )
                        //],
                        //),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loginUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    String _email = _emailditingController.text;
    String _pass = _passEditingController.text;
    // print(_email);
    // print(_pass);

    http.post(Uri.parse("${MyServerConfig.server}/bookbytes/php/userlogin.php"),
        body: {"email": _email, "password": _pass}).then((response) {
     // print(response.statusCode);
     print(response.body);
      if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          //print(data);
          if (data['status'] == "success") {
            User user = User.fromJson(data['data']);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Login Success"),
              backgroundColor: Colors.green,
            ));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (content) => MainPage(
                          userdata: user,
                        )));

        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Failed"),
            backgroundColor: Colors.red,
          ));
        }
      }
    });
  }

  void saveremovepref(bool value) async {
    String email = _emailditingController.text;
    String password = _passEditingController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value) {
      //save pref
      await prefs.setString('email', email);
      await prefs.setString('pass', password);
      await prefs.setBool('rem', value);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Preferences Stored"),
        backgroundColor: Colors.green,
      ));
    } else {
      //remove pref
      await prefs.setString('email', '');
      await prefs.setString('pass', '');
      await prefs.setBool('rem', false);
      _emailditingController.text = '';
      _passEditingController.text = '';
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Preferences Removed"),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> loadpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    _isChecked = (prefs.getBool('rem')) ?? false;
    if (_isChecked) {
      _emailditingController.text = email;
      _passEditingController.text = password;
    }
    setState(() {});
  }
}
