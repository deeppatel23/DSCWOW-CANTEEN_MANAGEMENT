import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_app/authenticate/SignUpPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  var state = "true";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance
      .collection("startstop")
      .document("nsbLA2tTBDx1N02rwxn6")
      .get()
      .then((value) {
    state = value.data()['value'].toString();
    print(state);
    if (state == "true") {
      runApp(SignUpPage());
    } else {
      runApp(closed());
    }
  });
  /*if (state == "true")
    runApp(SignUpPage());
    else
      runApp(closed());*/
}

class closed extends StatefulWidget {
  @override
  _closedState createState() => _closedState();
}

class _closedState extends State<closed> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  height: 200,
                  width: 300,
                  child: Image.asset(
                    'assets/closeddown.jpg',
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "The canteen is closed",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
