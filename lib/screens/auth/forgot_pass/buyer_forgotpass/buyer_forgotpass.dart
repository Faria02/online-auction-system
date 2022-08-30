import 'package:auction/screens/auth/forgot_pass/buyer_forgotpass/buyer_forgotpass_large.dart';
import 'package:auction/screens/auth/forgot_pass/buyer_forgotpass/buyer_forgotpass_medium.dart';
import 'package:flutter/material.dart';

class buyerForgotPass extends StatelessWidget {
  const buyerForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const buyerForgotPassMedium();
        } else {
          return const buyerForgotPassLarge();
        }
      }),
    ));
  }
}
