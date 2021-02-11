import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prjct/Pages/home_screen.dart';

class HomePage extends StatefulWidget {
  final UserInfo userInfo;

  HomePage({Key key, this.userInfo}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomeScreen _home_screen_obj = new HomeScreen();
  List<List> _user_info_list = [
    ["Name1", 34.3],
    ["Name2", 45.6],
    ["Name3", 456.3],
    ["Name1", 34.3],
    ["Name2", 45.6],
    ["Name3", 456.3],
    ["Name1", 34.3],
    ["Name2", 45.6],
    ["Name3", 456.3],
    ["Name1", 34.3],
    ["Name2", 45.6],
    ["Name3", 456.3],
    ["Name1", 34.3],
    ["Name2", 45.6],
    ["Name3", 456.3],
    ["Name1", 34.3],
    ["Name2", 45.6],
    ["Name3", 456.3],
    ["Name1", 34.3],
    ["Name2", 45.6],
    ["Name3", 456.3]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(_user_info_list.length, (index) {
            print("_user_info_list[" +
                index.toString() +
                "] : " +
                _user_info_list.toString());
            return Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 4.0, top: 4.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 2.5,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Name : " + _user_info_list[index][0],
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Water Quantity : " +
                                  _user_info_list[index][1].toString(),
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
