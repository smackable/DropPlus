import 'package:flutter/material.dart';
import 'package:flutter_gauge/flutter_gauge.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

// Git check
class _ProfilePageState extends State<ProfilePage> {
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
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            right: 250,
                            left: 10,
                          ),
                          child: Text(
                            "Name :",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        elevation: 2.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Card(
                        //Water used Card
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            right: 220,
                            left: 10,
                          ),
                          child: Text(
                            "Water Used:",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
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
                              onPressed: () => {},
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
                height: 460,
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
                                FlutterGauge(
                                    //Guage 1
                                    secondsMarker: SecondsMarker.none,
                                    hand: Hand.short,
                                    number: Number.none,
                                    index: 66.0,
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
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: FlutterGauge(
                                  // Guage 2
                                  secondsMarker: SecondsMarker.none,
                                  hand: Hand.short,
                                  number: Number.none,
                                  index: 66.0,
                                  circleColor: Colors.blue,
                                  counterStyle: TextStyle(
                                      fontFamily: 'YanoneKaffeesatz',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 25),
                                  counterAlign: CounterAlign.center,
                                  isDecimal: false),
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
