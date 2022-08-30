import 'package:auction/screens/auth/buyer_login/buyerlogin_large.dart';
import 'package:auction/screens/auth/buyer_login/buyerlogin_medium.dart';
import 'package:flutter/material.dart';

class buyerLogin extends StatelessWidget {
  const buyerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const buyerloginMedium();
        } else {
          return const buyerloginLarge();
        }
      }),
    ));
  }
}
