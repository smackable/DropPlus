import 'package:flutter/material.dart';
import 'package:flutter_gauge/flutter_gauge.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prjct/Pages/list.dart';
import 'user_info_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProfilePage extends StatefulWidget {
  var index = 0;
  ProfilePage({index, Key key}) : super(key: key) {
    this.index = index;
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

// Git check
class _ProfilePageState extends State<ProfilePage> {
  final databaseReference = FirebaseDatabase.instance.reference();
  var s1 = true;
  void changeval(val) {
    setState(() {
      s1 = val;
    });
    if (val) {
      databaseReference
          .child("z2Ix9odfi5RyMWTpn6KvLUEhSy82")
          .child("profile A")
          .update({'motor': '0'});
    } else {
      databaseReference
          .child("z2Ix9odfi5RyMWTpn6KvLUEhSy82")
          .child("profile A")
          .update({'motor': '1'});
    }
  }
  // double wtrfln;
  // double intank;

  @override
  Widget build(BuildContext context) {
    // databaseReference
    //     .child("z2Ix9odfi5RyMWTpn6KvLUEhSy82")
    //     .once()
    //     .then((DataSnapshot snapshot) {

    //   var val = snapshot.value;
    //   wtrfln = val["profile A"]["Water flown"];
    //   print("Water flown : $wtrfln");

    //   intank = val["profile A"]["tank Capacity"];
    //   print(" In tank : $intank");
    // });
    var name = "Name : " + list.user_info_list[widget.index][0];
    var wtr_required =
        "Water Required : " + list.user_info_list[widget.index][1].toString();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: 'raleway', fontSize: 25, fontWeight: FontWeight.bold),
        ),
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
                                name,
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
                                wtr_required,
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
                            child: ElevatedButton(
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
                                          ElevatedButton(
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
                    child: StreamBuilder(
                      stream: FirebaseDatabase.instance
                          .reference()
                          .child("z2Ix9odfi5RyMWTpn6KvLUEhSy82")
                          .onValue,
                      builder: (context, AsyncSnapshot<Event> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print("waiting");
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var val = snapshot.data.snapshot.value;
                          print(
                              "In stream builder ${snapshot.data.snapshot.value}");

                          // return waterGauge(val['profile A']['tank Capacity'],
                          //     val['profile A']['Water flown']);
                          return Container(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Water in tank : ( in l )',
                                              style: TextStyle(
                                                  fontFamily: 'raleway',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 200,
                                              width: 200,
                                              child: SfRadialGauge(axes: <
                                                  RadialAxis>[
                                                RadialAxis(
                                                    minimum: 0,
                                                    maximum: 100,
                                                    ranges: <GaugeRange>[
                                                      GaugeRange(
                                                          startValue: 0,
                                                          endValue: 50,
                                                          color: Colors
                                                              .blueGrey[600]),
                                                      GaugeRange(
                                                          startValue: 50,
                                                          endValue: 100,
                                                          color: Color(
                                                              0xffF9AA33)),
                                                      GaugeRange(
                                                          startValue: 100,
                                                          endValue: 150,
                                                          color: Colors.red)
                                                    ],
                                                    pointers: <GaugePointer>[
                                                      NeedlePointer(
                                                        value: val['profile A']
                                                            ['tank Capacity'],
                                                      )
                                                    ],
                                                    annotations: <
                                                        GaugeAnnotation>[
                                                      GaugeAnnotation(
                                                          widget: Container(
                                                              child: Text('',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          angle: 90,
                                                          positionFactor: 0.5)
                                                    ])
                                              ]),
                                            )

                                            // FlutterGauge(
                                            //     //Guage 1
                                            //     secondsMarker:
                                            //         SecondsMarker.none,
                                            //     hand: Hand.short,
                                            //     number: Number.none,
                                            //     index: val['profile A']
                                            //         ['tank Capacity'],
                                            //     circleColor:
                                            //         Colors.blueGrey[600],
                                            //     counterStyle: TextStyle(
                                            //         fontFamily:
                                            //             'YanoneKaffeesatz',
                                            //         fontWeight: FontWeight.bold,
                                            //         color: Colors.black,
                                            //         fontSize: 25),
                                            //     counterAlign:
                                            //         CounterAlign.center,
                                            //     isDecimal: false),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Water used : ( in l )',
                                              style: TextStyle(
                                                  fontFamily: 'raleway',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 200,
                                              width: 200,
                                              child: SfRadialGauge(axes: <
                                                  RadialAxis>[
                                                RadialAxis(
                                                    minimum: 0,
                                                    maximum: 100,
                                                    ranges: <GaugeRange>[
                                                      GaugeRange(
                                                          startValue: 0,
                                                          endValue: 50,
                                                          color: Colors
                                                              .blueGrey[600]),
                                                      GaugeRange(
                                                          startValue: 50,
                                                          endValue: 100,
                                                          color: Color(
                                                              0xffF9AA33)),
                                                      GaugeRange(
                                                          startValue: 100,
                                                          endValue: 150,
                                                          color: Colors.red)
                                                    ],
                                                    pointers: <GaugePointer>[
                                                      NeedlePointer(
                                                        value: val['profile A']
                                                            ['Water flown'],
                                                      )
                                                    ],
                                                    annotations: <
                                                        GaugeAnnotation>[
                                                      GaugeAnnotation(
                                                          widget: Container(
                                                              child: Text('',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          angle: 90,
                                                          positionFactor: 0.5)
                                                    ])
                                              ]),
                                            ),
                                            // FlutterGauge(
                                            //     // Guage 2
                                            //     secondsMarker:
                                            //         SecondsMarker.none,
                                            //     hand: Hand.short,
                                            //     number: Number.none,
                                            //     index: val['profile A']
                                            //         ['Water flown'],
                                            //     circleColor:
                                            //         Colors.blueGrey[600],
                                            //     counterStyle: TextStyle(
                                            //         fontFamily:
                                            //             'YanoneKaffeesatz',
                                            //         fontWeight: FontWeight.bold,
                                            //         color: Colors.black,
                                            //         fontSize: 25),
                                            //     counterAlign:
                                            //         CounterAlign.center,
                                            //     isDecimal: false),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors
                                                                  .blueGrey[
                                                              600], // background
                                                          onPrimary: Colors
                                                              .white, // foreground
                                                        ),
                                                        child: Text("Reset"),
                                                        onPressed: () {}),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 200.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Motor : ",
                                                style: TextStyle(
                                                    fontFamily: 'raleway',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Switch(
                                                  value: s1,
                                                  activeColor:
                                                      Colors.blueGrey[600],
                                                  activeTrackColor:
                                                      Color(0xffF9AA33),
                                                  inactiveThumbColor:
                                                      Colors.blueGrey[600],
                                                  inactiveTrackColor:
                                                      Colors.blueGrey[100],
                                                  onChanged: (val) {
                                                    changeval(val);
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
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
