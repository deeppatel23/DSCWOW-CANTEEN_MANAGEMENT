import 'package:flutter/material.dart';
import 'package:user_app/HomePage.dart';
import 'package:user_app/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app/widgets/BottomNavBarWidget.dart';

class FeedBack extends StatefulWidget {
  @override
  _BestFoodWidgetState createState() => _BestFoodWidgetState();
}

TextEditingController feedbackController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;
User user = _auth.currentUser;

class _BestFoodWidgetState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Form',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            'Feedback',
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 200,
                  child: TextFormField(
                    controller: feedbackController,
                    decoration: new InputDecoration(
                      hintText: 'Feedback',
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: new Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SignInButtonWidget2(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}

class SignInButtonWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFfbab66),
          ),
          BoxShadow(
            color: Color(0xFFf7418c),
          ),
        ],
        gradient: new LinearGradient(
            colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
            begin: const FractionalOffset(0.2, 0.2),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: Color(0xFFf7418c),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
            child: Text(
              "SUBMIT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: "WorkSansBold"),
            ),
          ),
// /<<<<<<< ui
          onPressed: () => {
                submitFeedback(),
              }),
// =======
      // onPressed: () => {createRecord()}),
// />>>>>>> main
    );
  }
}

submitFeedback() {
  print(feedbackController);
  FirebaseFirestore.instance
      .collection('feedback')
      .add({"feedback": feedbackController.text, "name": currentUser})
      .then((result) => {})
      .catchError((err) => Dialog(child: Text("error")));
  feedbackController.clear();
}
