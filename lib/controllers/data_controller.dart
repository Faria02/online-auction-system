import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;
  //Map userProfileData = {'userName': '', 'joinDate': ''};

  void onReady() {
    super.onReady();

    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    Future<void> addNewProduct(Map productdata, File image) async {
      var pathimage = image.toString();
      var temp = pathimage.lastIndexOf('/');
      var result = pathimage.substring(temp + 1);
      print(result);
      final ref =
          FirebaseStorage.instance.ref().child('product_images').child(result);
      var response = await ref.putFile(image);
      print("Updated $response");
      var imageUrl = await ref.getDownloadURL();

      try {
        //CommanDialog.showLoading();
        var response = await firebaseInstance.collection('productlist').add({
          'product_name': productdata['p_name'],
          'product_price': productdata['p_price'],
          "product_upload_date": productdata['p_upload_date'],
          'product_image': imageUrl,
          //'user_Id': authController.userId,
          "phone_number": productdata['phone_number'],
        });
        print("Firebase response1111 $response");
        //CommanDialog.hideLoading();
        Get.back();
      } catch (exception) {
        //CommanDialog.hideLoading();
        print("Error Saving Data at firestore $exception");
      }
    }
  }

  void addNewProduct(Map<String, dynamic> productData, userImageFile) {}
}
