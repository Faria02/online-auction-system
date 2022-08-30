import 'package:auction/screens/auth/forgot_pass/seller_forgotpass/seller_forgotpass.dart';
import 'package:auction/screens/auth/seller_reg/seller_reg.dart';
import 'package:auction/screens/sellerdash.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class sellerloginLarge extends StatefulWidget {
  const sellerloginLarge({Key? key}) : super(key: key);

  @override
  State<sellerloginLarge> createState() => _sellerloginLargeState();
}

class _sellerloginLargeState extends State<sellerloginLarge> {
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  // creat a text controller and use it to retrieve the current value of the TextField
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/mainlogin.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 50, bottom: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black38),
            width: MediaQuery.of(context).size.width / 2,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
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
                ),
                const Text(
                  'Seller Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 18,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            autofocus: false,
                            decoration: const InputDecoration(
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              hintText: 'abc@mail.com',
                              hintStyle: TextStyle(
                                color: Colors.white60,
                              ),
                              label: Text(
                                'Email',
                              ),
                              labelStyle:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              errorStyle: TextStyle(
                                  fontSize: 16, color: Colors.redAccent),
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please Enter Valid Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            autofocus: false,
                            obscureText: true,
                            decoration: const InputDecoration(
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.white60,
                              ),
                              label: Text('Password'),
                              labelStyle:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              errorStyle: TextStyle(
                                  fontSize: 16, color: Colors.redAccent),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20)

                              //
                              ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;
                              });
                            }
                            signIn();
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, a, b) =>
                                      const sellerForgotPass()),
                              (route) => false);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                FittedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 100,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, a, b) =>
                                        const sellerReg()),
                                (route) => false);
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Successfully login!");
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                pageBuilder: (context, a, b) => const sellerDashboard()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Fluttertoast.showToast(
          msg: "Wrong password provided for that user.",
        );
      }
    }
  }
}
