import 'dart:io';

import 'package:auction/controllers/data_controller.dart';
import 'package:auction/screens/product_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class sellerAddproduct extends StatefulWidget {
  const sellerAddproduct({Key? key}) : super(key: key);

  @override
  State<sellerAddproduct> createState() => _sellerAddproductState();
}

class _sellerAddproductState extends State<sellerAddproduct> {
  DataController controller = Get.find();
  //final DataController controller = Get.put(DataController());
  var _userImageFile;
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> productData = {
    "p_name": "",
    "p_price": "",
    "p_upload_date": DateTime.now().millisecondsSinceEpoch,
    "phone_number": ""
  };

  void _pickedImage(File image) {
    _userImageFile = image;
    print('Image got $_userImageFile');
  }

  addProduct() {
    if (_userImageFile == null) {
      Get.snackbar(
        "Opps",
        "Image Required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme.of(context).errorColor,
        colorText: Colors.white,
      );
      Fluttertoast.showToast(
        msg: "Opps! Image Required",
      );
      return;
    }

    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is vaid ");

      print('Data for new product $productData');
      controller.addNewProduct(productData, _userImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Product'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 300, vertical: 50),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Product Name Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      productData['p_name'] = value!;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Product Price'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Product Price Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      productData['p_price'] = value!;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number  Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      productData['phone_number'] = value!;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ProductImagePicker(_pickedImage),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: addProduct,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
