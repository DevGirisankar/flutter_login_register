import 'package:flutter/material.dart';
import 'package:flutter_login_signup/constants.dart';
import 'package:lottie/lottie.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: kBGColor,
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            child,
          ],
        ));
  }
}
