import 'package:flutter/material.dart';
import 'package:user_app/authenticate/SignInPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0,
          title: Text(
            "What would you like to eat?",
            style: TextStyle(
                color: Color(0xFF3a3737),

                /// ui
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),
            )
          ],
        ),
      ),
    );
  }
}
