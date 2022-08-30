import 'dart:io';
import 'dart:typed_data';

import 'package:auction/screens/seller_addproduct.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ProductImagePicker extends StatefulWidget {
  final void Function(File _pickedImage) getImageValue;
  ProductImagePicker(this.getImageValue);

  @override
  State<ProductImagePicker> createState() => _ProductImagePickerState();
}

class _ProductImagePickerState extends State<ProductImagePicker> {
  Uint8List webImage = Uint8List(8);
  var pickedImage;

  File? _pickedImage;
  void imagePickerOption() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 300),
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     print('Camera');
                  //     pickImage(ImageSource.camera);
                  //   },
                  //   icon: Icon(Icons.camera),
                  //   label: Text("Camera"),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      print('Gallery');
                      //pickImage(ImageSource.gallery);
                      _pickImage();
                    },
                    icon: Icon(Icons.image),
                    label: Text("Gallery"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, a, b) =>
                                  const sellerAddproduct()),
                          (route) => false);
                    },
                    icon: Icon(Icons.close),
                    label: Text("Cancel"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // pickImage(ImageSource imageType) async {
  //   final ImagePicker _picker = ImagePicker();
  //   try {
  //     final photo = await _picker.pickImage(source: imageType);
  //     if (photo == null) return;
  //     final tempImage = File(photo.path);
  //     setState(() {
  //       this.pickedImage = tempImage;
  //     });
  //     widget.getImageValue(pickedImage!);
  //     Get.back();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();

        setState(() {
          webImage = f;

          _pickedImage = File(image.path);

          widget.getImageValue(_pickedImage!);
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('something went wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 100,
          child: _pickedImage == null
              ? Image.network(
                  'https://static.thenounproject.com/png/2413564-200.png',
                  fit: BoxFit.cover,
                )
              : kIsWeb
                  ? Image.memory(
                      webImage,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      _pickedImage!,
                      fit: BoxFit.fill,
                    ),
        ),
        ElevatedButton.icon(
          onPressed: imagePickerOption,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
