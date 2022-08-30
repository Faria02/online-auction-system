import 'package:auction/screens/auth/admin_login/adminlogin.dart';
import 'package:auction/screens/auth/buyer_login/buyerlogin.dart';
import 'package:auction/screens/auth/mainlogin_topbar.dart';
import 'package:auction/screens/auth/seller_login/sellerlogin.dart';
import 'package:flutter/material.dart';

class mainLoginMedium extends StatelessWidget {
  const mainLoginMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'Online Auction System',
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w900,
              letterSpacing: 2),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const mainloginTopBar(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/mainlogin.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        child: Container(
                      child: Column(
                        children: [
                          FractionallySizedBox(
                            widthFactor: 0.6,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (context, a, b) =>
                                            const adminLogin()),
                                    (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 55),
                                primary: const Color(0xff373e98),
                              ),
                              child: const Text(
                                'Admin Login',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.6,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (context, a, b) =>
                                            const sellerLogin()),
                                    (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 55),
                                primary: const Color(0xff373e98),
                              ),
                              child: const Text(
                                'Seller Login',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.6,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (context, a, b) =>
                                            const buyerLogin()),
                                    (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 55),
                                primary: const Color(0xff373e98),
                              ),
                              child: const Text(
                                'Buyer Login',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                Container(
                  color: const Color(0xff373e98),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('assets/images/logo.jpg'),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'HOME',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'ABOUT',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'CONTACT',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'PRIVACY POLICY',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Contact with us',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 15,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Phone: 01793826563',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                letterSpacing: 1),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'E-mail: cse1805003brur@gmail.com',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                letterSpacing: 1),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'WhatsApp: +8801793826563',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
