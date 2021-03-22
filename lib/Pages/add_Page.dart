import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prjct/Pages/list.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _name;
  double _waterQuantity;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FocusNode water_quantity = new FocusNode();

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
          focusNode: water_quantity,
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
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    water_quantity.unfocus();
                    var lst = [_name, _waterQuantity];
                    list.user_info_list.add(lst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Submitted successfully"),
                      ),
                    );
                    style:
                    ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    );
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
