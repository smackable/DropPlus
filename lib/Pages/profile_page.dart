import 'package:flutter/material.dart';
import 'package:flutter_gauge/flutter_gauge.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

// Git check
class _ProfilePageState extends State<ProfilePage> {
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, right: 5, left: 5, bottom: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                //Main Card
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 8),
                  child: Column(
                    children: [
                      Card(
                        //Name Card
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 4, left: 8, right: 8),
                              child: Text(
                                "Name : ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        elevation: 2.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Card(
                        //Water used Card
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 2, left: 8, right: 8),
                              child: Text(
                                "Water Required : ",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        elevation: 2.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        //Edit Button
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 4),
                          child: SizedBox(
                            width: 80,
                            height: 25,
                            child: RaisedButton(
                              onPressed: () => {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        title: Text('Edit'),
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Form(
                                            child: Column(
                                              children: <Widget>[
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText: 'Name',
                                                    icon:
                                                        Icon(Icons.account_box),
                                                  ),
                                                ),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText: 'Water Required',
                                                    icon: Icon(
                                                      Icons
                                                          .water_damage_outlined,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          RaisedButton(
                                              child: Text("Submit"),
                                              onPressed: () {})
                                        ],
                                      );
                                    }),
                              },
                              child: Text('Edit'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  //Water Guage CArd
                  elevation: 2.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Water in tank :',
                                  style: TextStyle(
                                      fontFamily: 'raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                FlutterGauge(
                                    //Guage 1
                                    secondsMarker: SecondsMarker.none,
                                    hand: Hand.short,
                                    number: Number.none,
                                    index: 40,
                                    circleColor: Colors.blue,
                                    counterStyle: TextStyle(
                                        fontFamily: 'YanoneKaffeesatz',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 25),
                                    counterAlign: CounterAlign.center,
                                    isDecimal: false),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Water used :',
                                  style: TextStyle(
                                      fontFamily: 'raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                FlutterGauge(
                                    // Guage 2
                                    secondsMarker: SecondsMarker.none,
                                    hand: Hand.short,
                                    number: Number.none,
                                    index: 80.0,
                                    circleColor: Colors.blue,
                                    counterStyle: TextStyle(
                                        fontFamily: 'YanoneKaffeesatz',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 25),
                                    counterAlign: CounterAlign.center,
                                    isDecimal: false),
                                RaisedButton(
                                    child: Text("Reset"), onPressed: () {})
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
