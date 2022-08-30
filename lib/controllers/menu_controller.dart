import 'package:auction/screens/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OverViewPageRoute.obs;
  var hoverItem = "".obs;
  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;
  // Widget returnIconFor(String itemNaame) {
  //   return Container();
  // }
  // Widget _customIcon (IconData icon, String itemName){
  //   if(isActive(itemName)) return
  // }
}
