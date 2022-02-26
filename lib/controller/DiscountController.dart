import 'package:get/get.dart';
import 'package:shopy/model/Discount_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopy/view/home/home_view.dart';
//import 'package:shopy/view/cart/cart.dart';
import 'package:shopy/model/Category_model.dart';
import 'package:shopy/model/Product_model.dart';

class DiscountController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<Discount> get discounts => _discounts;
  List<Discount> _discounts = <Discount>[];
  DiscountController() {
    getDiscounts();
  }

  getDiscounts() async {
    _loading.value = true;
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('discounts').get();
    List docs = snapshot.docs;

    docs.forEach((doc) {
      Discount discount = new Discount(doc["id"], doc["discount"]);
      _discounts.add(discount);
    });
    _loading.value = false;
    update();
  }
}
