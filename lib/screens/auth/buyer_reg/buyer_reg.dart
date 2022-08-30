import 'package:auction/screens/auth/buyer_reg/buyer_reg_large.dart';
import 'package:auction/screens/auth/buyer_reg/buyer_reg_medium.dart';
import 'package:flutter/material.dart';

class buyerReg extends StatelessWidget {
  const buyerReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const buyerRegMedium();
        } else {
          return const buyerRegLarge();
        }
      }),
    ));
  }
}
