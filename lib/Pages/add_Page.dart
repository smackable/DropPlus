import 'dart:ui';

import 'package:flutter/material.dart';
import 'user_info_model.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _name;
  double _waterQuantity;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: "Name",
          labelStyle: TextStyle(fontSize: 20),
          hintText: "Enter the username",
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return "Invalid Name";
          }
        },
        onChanged: (String value) {
          _name = value;
        });
  }

  Widget _buildWaterQuantity() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
          decoration: InputDecoration(
            labelText: "Water Required",
            labelStyle: TextStyle(fontSize: 20),
            hintText: "Enter the water required ",
            hintStyle: TextStyle(color: Colors.grey[400]),
            suffixIcon: SizedBox(
              child: Center(
                widthFactor: 0,
                child: Text(
                  '\Ltr',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return "Invalid water Quantity";
            }
          },
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            _waterQuantity = double.parse(value);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add user",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(25),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildWaterQuantity(),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                  onPressed: () {
                    var _userInfo = new UserInfoModel(_name, _waterQuantity);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Submitted successfully"),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
