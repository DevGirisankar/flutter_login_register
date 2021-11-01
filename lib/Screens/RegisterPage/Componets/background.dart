import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_login_signup/constants.dart';

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
        width: size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: SizedBox(
                height: 500,
                child: Lottie.network(
                    'https://raw.githubusercontent.com/DevGirisankar/Lottie-files/main/wave.json',
                    width: size.width,
                    fit: BoxFit.fill),
              ),
              top: 0,
            ),
            child,
          ],
        ));
  }
}
