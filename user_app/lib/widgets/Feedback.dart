import 'package:flutter/material.dart';
import 'package:user_app/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBack extends StatefulWidget {
  @override
  _BestFoodWidgetState createState() => _BestFoodWidgetState();
}

TextEditingController feedbackController = TextEditingController();

class _BestFoodWidgetState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: currentUser,
      home: Scaffold(
        body: Center(
          child: Column(
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
                    border: new Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: submitFeedback(),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
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
}
