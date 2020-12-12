import 'package:user_app/animation/ScaleRoute.dart';
import 'package:user_app/widgets/BestFoodWidget.dart';
import 'package:user_app/widgets/BottomNavBarWidget.dart';
import 'package:user_app/widgets/PopularFoodsWidget.dart';
import 'package:user_app/widgets/SearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:user_app/authenticate/SignInPage.dart';
import 'package:user_app/foods/DisplayFood.dart';
import 'package:user_app/global.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  Icons.logout,
                  color: Color(0xFF3a3737),
                ),
                onPressed: () {
                  currentUser = " ";
                  items = new List();
                  quantity = new List<int>();
                  prices = new List<double>();
                  uid = 'Ovj2ey5RS3sc1YaAmyJQ';
                  total = calculateTotal();
                  _auth.signOut().then(
                        (res) => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignInPage())),
                      );
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SearchWidget(),
              Text(
                "All Food Items",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3a3a3b),
                    fontWeight: FontWeight.w300),
              ),
              ShowCategory(),
              Text(
                "Sort by category",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3a3a3b),
                    fontWeight: FontWeight.w300),
              ),
              BestFoodWidget(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}
