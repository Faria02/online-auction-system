import 'package:auction/screens/auth/admin_login/adminlogin_large.dart';
import 'package:auction/screens/auth/admin_login/adminlogin_medium.dart';
import 'package:flutter/material.dart';

class adminLogin extends StatelessWidget {
  const adminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const adminloginMedium();
        } else {
          return const adminloginLarge();
        }
      }),
    ));
  }
}
