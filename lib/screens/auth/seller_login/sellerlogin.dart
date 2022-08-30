import 'package:auction/screens/auth/seller_login/sellerlogin_large.dart';
import 'package:auction/screens/auth/seller_login/sellerlogin_medium.dart';
import 'package:flutter/material.dart';

class sellerLogin extends StatelessWidget {
  const sellerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const sellerloginMedium();
        } else {
          return const sellerloginLarge();
        }
      }),
    ));
  }
}
