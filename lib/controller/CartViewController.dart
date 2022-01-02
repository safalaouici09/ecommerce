import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopy/Services/database/CartDB.dart';
import 'package:shopy/model/CartProduct_model.dart';
import 'package:shopy/Services/database/CartDB.dart';
import 'package:shopy/model/Product_model.dart';

class CartViewController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<Product> get allProduct => allProduct;
  List _allProduct = [];

  addProduct(CartProduct cartProduct) async {
    //var dbHelper = CartDB.db;
    await CartDB.db.insert(cartProduct);
    update();
  }

  CartViewController() {
    getAllPros();
  }

  getAllPros() async {
    _loading.value = true;
    // var dbHelper = CartDB.db;
    _allProduct = await CartDB.db.getAllPros();

    _loading.value = false;
    update();
  }
}
