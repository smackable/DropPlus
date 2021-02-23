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
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 8),
                  child: Column(
                    children: [
                      Card(
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
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            right: 250,
                            left: 10,
                          ),
                          child: Text(
                            "Text :",
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
                  elevation: 2.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        FlutterGauge(
                            handSize: 25,
                            index: 40.0,
                            end: 100,
                            number: Number.endAndCenterAndStart,
                            circleColor: Color(0xFF47505F),
                            secondsMarker: SecondsMarker.secondsAndMinute,
                            counterStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
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
