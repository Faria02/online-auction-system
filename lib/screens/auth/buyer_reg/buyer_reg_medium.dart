import 'package:auction/screens/auth/buyer_login/buyerlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class buyerRegMedium extends StatefulWidget {
  const buyerRegMedium({Key? key}) : super(key: key);

  @override
  State<buyerRegMedium> createState() => _buyerRegMediumState();
}

class _buyerRegMediumState extends State<buyerRegMedium> {
  final items = ['Seller', 'Customer'];
  String? value;
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmPassword = "";

  // creat a text controller and use it to retrieve the current value of the TextField
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/mainlogin.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 60, right: 60),
          margin:
              const EdgeInsets.only(right: 70, left: 70, top: 40, bottom: 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black38),
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(
                child: Text(
                  'Buyer Registration',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
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
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: 'Enter Your Name',
                          hintStyle: TextStyle(
                            color: Colors.white60,
                          ),
                          label: Text(
                            'Name',
                          ),
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        controller: nameController,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
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
                          errorStyle:
                              TextStyle(fontSize: 16, color: Colors.redAccent),
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
                      widthFactor: 1,
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
                          errorStyle:
                              TextStyle(fontSize: 16, color: Colors.redAccent),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
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
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.white60,
                          ),
                          label: Text('Confirm Password'),
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                          errorStyle:
                              TextStyle(fontSize: 16, color: Colors.redAccent),
                        ),
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Re-enter Password';
                          } else if (value != passwordController.text) {
                            return 'Password not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                  ],
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          //name = nameController.text;
                          email = emailController.text;
                          password = passwordController.text;
                          confirmPassword = confirmPasswordController.text;
                        });
                      }
                      signUp();
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              FittedBox(
                child: Row(
                  children: [
                    const Text(
                      'Already have an account?',
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
                                      const buyerLogin()),
                              (route) => false);
                        },
                        child: const Text(
                          'Signin',
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
    ));
  }

  signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Registration Successful ! Please Login");
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                pageBuilder: (context, a, b) => const buyerLogin()),
            (route) => false);
      }

      buyerSaveUserData();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      }
    }
  }

  buyerSaveUserData() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('Buyers').doc(emailController.text).set({
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text
    });
  }
}
