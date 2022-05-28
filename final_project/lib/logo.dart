import 'package:flutter/material.dart';
import 'homepage.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Column(children: [
          Image.asset(
            "images/1.png",
            width: 1000,
            height: 500,
          ),
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(color: Colors.white),
              primary: Color(0xFF1321E0),
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 20.0, left: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 200,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddNote()),
              );
            },
            child: Text("Get started"),
          )),
        ]));
  }
}
