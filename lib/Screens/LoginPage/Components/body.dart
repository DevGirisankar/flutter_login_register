import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_signup/Screens/ListPage/list_page.dart';
import 'package:flutter_login_signup/Screens/RegisterPage/register.dart';
import 'package:flutter_login_signup/constants.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    // FocusNode myFocusNode = new FocusNode();

    return (Background(
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          child: const Image(
                            image: AssetImage('assets/images/back.png'),
                            width: 30,
                            height: 30,
                          ))),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Let\'s sign you in.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Welcome back.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 28),
                ),
                const Text(
                  'You have been missed!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 28),
                ),
                const SizedBox(
                  height: 60,
                ),
                const SizedBox(
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
                            borderSide: BorderSide(color: kFieldTextColor)),
                        labelText: 'User name',
                        labelStyle: TextStyle(color: kFieldTextColor)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
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
                            borderSide: BorderSide(color: kFieldTextColor)),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: kFieldTextColor)),
                  ),
                ),
              ],
            ),
          )),
          Align(
              alignment: FractionalOffset.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        color: kFieldTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Hero(
                      tag: 'buttonRegister',
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (builder) {
                              return const RegisterPage();
                            }));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kBGColor)),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
                height: 60,
                child: Hero(
                    tag: 'buttonLogin',
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ListPage();
                          }));
                        },
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: const Center(
                          child: Text('Log In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16)),
                        )))),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
