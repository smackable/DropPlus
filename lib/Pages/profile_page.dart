import 'package:flutter/material.dart';

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
      body: Padding(
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
                padding: const EdgeInsets.only(bottom: 80.0, top: 4),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 2,
                          bottom: 2,
                          right: 120,
                          left: 120,
                        ),
                        child: Text("Name"),
                      ),
                      elevation: 2.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(child: Padding(padding: EdgeInsets.all(8)))
          ],
        ),
      ),
    );
  }
}
