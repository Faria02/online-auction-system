import 'package:auction/screens/auth/mainlogin.dart';
import 'package:flutter/material.dart';

class adminDashboard extends StatelessWidget {
  const adminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xff373e98),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          const Text(
                            'Admin Dashboard',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     PageRouteBuilder(
                              //         pageBuilder: (context, a, b) =>
                              //             const mainLoginLarge()),
                              //     (route) => false);
                            },
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          const Text(
                            'About',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          const Text(
                            'Contact',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          const mainLogin()),
                                  (route) => false);
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.red,
                    child: Text('data'),
                  )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.blue,
                        child: Text('data'),
                      ))
                ],
              ),
              Container(
                color: const Color(0xff373e98),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 55,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/logo.jpg'),
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 18,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
        ),
      ),
    );
  }
}
