import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_signup/constants.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    FocusNode myFocusNode = new FocusNode();

    return (Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 180,
            ),
            Text(
              'Let\'s sign you in.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome back.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 28),
            ),
            Text(
              'You have been missed!',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 28),
            ),
            SizedBox(
              height: 59,
            ),
            Container(
              height: 70,
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: kFieldTextColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: new BorderSide(color: kFieldTextColor)),
                    labelText: 'User name',
                    labelStyle: TextStyle(color: kFieldTextColor)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: kFieldTextColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: new BorderSide(color: kFieldTextColor)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: kFieldTextColor)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
