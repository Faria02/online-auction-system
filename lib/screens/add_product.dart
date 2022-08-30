import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addProduct extends StatefulWidget {
  const addProduct({Key? key}) : super(key: key);

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  final _formKey = GlobalKey<FormState>();

  var description = "";
  var title = "";
  var catagory = "";
  var brand = "";
  List<String> collectionName = [
    'top',
    'sold',
  ];

  // creat a text controller and use it to retrieve the current value of the TextField
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final catagoryController = TextEditingController();
  final brandController = TextEditingController();
  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    catagoryController.dispose();
    brandController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   width: double.infinity,
      //   height: double.infinity,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/images/mainlogin.jpg'),
      //       fit: BoxFit.cover,
      //       colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
      // ),
      //child: Center(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 60, right: 60),
          margin: const EdgeInsets.only(top: 40, bottom: 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          width: MediaQuery.of(context).size.width / 2,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FittedBox(
                  child: Text(
                    'Add Your Product',
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
                            //

                            hintText: 'Product Title',
                            hintStyle: TextStyle(
                              color: Colors.white60,
                            ),

                            //
                          ),
                          controller: titleController,
                          //
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
                            hintText: 'Product Details',
                            hintStyle: TextStyle(
                              color: Colors.white60,
                            ),
                            errorStyle: TextStyle(
                                fontSize: 16, color: Colors.redAccent),
                          ),
                          controller: descriptionController,
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
                            hintText: 'Catagory',
                            hintStyle: TextStyle(
                              color: Colors.white60,
                            ),
                            errorStyle: TextStyle(
                                fontSize: 16, color: Colors.redAccent),
                          ),
                          controller: catagoryController,
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
                            hintText: 'Brand',
                            hintStyle: TextStyle(
                              color: Colors.white60,
                            ),
                            errorStyle: TextStyle(
                                fontSize: 16, color: Colors.redAccent),
                          ),
                          controller: brandController,
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
                              vertical: 20, horizontal: 20)

                          //
                          ),
                      onPressed: () {
                        saveUserData('top');
                        setState(() {});
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //),
  }

  saveUserData(String collectionName) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection(collectionName).doc().set({
      'title': titleController.text,
      'description': descriptionController.text,
      'catagory': catagoryController.text,
      'brand': brandController.text
    });
  }
}
