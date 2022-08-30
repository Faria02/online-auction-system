import 'package:auction/screens/auth/mainlogin.dart';
import 'package:flutter/material.dart';

class productTopBar extends StatelessWidget {
  const productTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.grey.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (() {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     PageRouteBuilder(
                      //         pageBuilder: (context, a, b) =>
                      //             const LoginPage()),
                      //     (route) => false);
                    }),
                    child: const Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Divider(
                      color: Colors.blueGrey.shade400,
                      thickness: 1,
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     PageRouteBuilder(
                      //         pageBuilder: (context, a, b) =>
                      //             const sellerLogin()),
                      //     (route) => false);
                    }),
                    child: const Text(
                      'About',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Divider(
                      color: Colors.blueGrey.shade400,
                      thickness: 1,
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      //   Navigator.pushAndRemoveUntil(
                      //       context,
                      //       PageRouteBuilder(
                      //           pageBuilder: (context, a, b) =>
                      //               const customerLogin()),
                      //       (route) => false);
                    }),
                    child: const Text(
                      'Contact',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Divider(
                      color: Colors.blueGrey.shade400,
                      thickness: 1,
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, a, b) =>
                                  const mainLogin()),
                          (route) => false);
                    }),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Copyright @ 2022 | OnlineAuction',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
