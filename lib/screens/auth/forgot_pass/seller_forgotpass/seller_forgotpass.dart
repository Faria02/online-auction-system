import 'package:auction/screens/auth/forgot_pass/seller_forgotpass/seller_forgotpass_large.dart';
import 'package:auction/screens/auth/forgot_pass/seller_forgotpass/seller_forgotpass_medium.dart';
import 'package:flutter/material.dart';

class sellerForgotPass extends StatelessWidget {
  const sellerForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const sellerForgotPassMedium();
        } else {
          return const sellerForgotPassLarge();
        }
      }),
    ));
  }
}
