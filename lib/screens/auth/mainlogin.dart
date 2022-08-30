import 'package:auction/screens/auth/mainlogin_large.dart';
import 'package:auction/screens/auth/mainlogin_medium.dart';
import 'package:flutter/material.dart';

class mainLogin extends StatelessWidget {
  const mainLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const mainLoginMedium();
        } else {
          return const mainLoginLarge();
        }
      }),
    ));
  }
}
