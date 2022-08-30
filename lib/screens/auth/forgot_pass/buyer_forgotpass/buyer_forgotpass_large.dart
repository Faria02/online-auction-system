import 'package:auction/screens/auth/buyer_login/buyerlogin.dart';
import 'package:flutter/material.dart';

class buyerForgotPassLarge extends StatefulWidget {
  const buyerForgotPassLarge({Key? key}) : super(key: key);

  @override
  State<buyerForgotPassLarge> createState() => _buyerForgotPassLargeState();
}

class _buyerForgotPassLargeState extends State<buyerForgotPassLarge> {
  final _formKey = GlobalKey<FormState>();
  var email = "";

  // creat a text controller and use it to retrieve the current value of the TextField
  final emailController = TextEditingController();

  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    emailController.dispose();
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
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 120, bottom: 120),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black38),
          width: MediaQuery.of(context).size.width / 2,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Reset link will be sent to your email',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
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
                                vertical: 20, horizontal: 20)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                            });
                            // resetPassword();
                          }
                        },
                        child: const Text(
                          'Send Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
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
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
