import 'package:auction/screens/homepage/homepage_large.dart';
import 'package:auction/screens/homepage/homepage_medium.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480 && constraints.maxWidth < 800) {
          return const HomePageMedium();
        } else {
          return const HomePageLarge();
        }
      }),
    ));
  }
}
