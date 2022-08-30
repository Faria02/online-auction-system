import 'package:auction/screens/auth/seller_reg/seller_reg_large.dart';
import 'package:auction/screens/auth/seller_reg/seller_reg_medium.dart';
import 'package:flutter/material.dart';

class sellerReg extends StatelessWidget {
  const sellerReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const sellerRegMedium();
        } else {
          return const sellerRegLarge();
        }
      }),
    ));
  }
}
