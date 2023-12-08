import 'dart:convert';

import 'package:bookbytes/models/util/Myservercofig.dart';
import 'package:bookbytes/view/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:bookbytes/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => checkandlogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 225, 196),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_img2.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              )
            ],
          ),
        ));
  }

  checkandlogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    bool rem = (prefs.getBool('rem')) ?? false;
    print(email+password);
    if (rem) {
      http.post(
          Uri.parse("${MyServerConfig.server}/bookbytes/php/userlogin.php"),
          body: {"email": email, "password": password}).then((response) {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status'] == "success") {
            User user = User.fromJson(data['data']);
            Timer(
                const Duration(seconds: 3),
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (content) => MainPage(userdata: user))));
          } else {
            User user = User(
                userid: "0",
                useremail: "unregistered@email.com",
                username: "Unregistered",
                userdatereg: "",
                userpass: "");
            Timer(
                const Duration(seconds: 3),
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (content) => MainPage(userdata: user))));
          }
        }
      });
    } else {
      User user = User(
          userid: "0",
          useremail: "unregistered@email.com",
          username: "Unregistered",
          userdatereg: "",
          userpass: "");
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (content) => MainPage(userdata: user))));
    }
  }
}
