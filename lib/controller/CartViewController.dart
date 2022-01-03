import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopy/Services/database/CartDB.dart';
import 'package:shopy/model/CartProduct_model.dart';
import 'package:shopy/Services/database/CartDB.dart';
import 'package:shopy/model/Product_model.dart';

class CartViewController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProduct> get allProduct => allProduct;
  List<CartProduct> _allProduct = [];
  CartProduct cartProduct1 =
      CartProduct(product_name: " skirt1", price: "18", quantity: 5);
  CartProduct cartProduct2 =
      CartProduct(product_name: " skirt1", price: "18", quantity: 5);

  CartProduct cartProduct3 =
      CartProduct(product_name: " skirt1", price: "18", quantity: 5);

  addProduct(CartProduct cartProduct) async {
    //var dbHelper = CartDB.db;
    await CartDB.db.insert(cartProduct);
    update();
  }

  CartViewController() {
    // getAllPros();
    _getData();
    addProduct(cartProduct1);
    addProduct(cartProduct2);
    addProduct(cartProduct3);
  }
  void _getData() {
    CartDB.db.queryAll().then((value) {
      value.forEach((element) {
        _allProduct.add(CartProduct(
            product_image: element['image'],
            product_name: element['name'],
            price: element['price'],
            quantity: element['quantity']));
        update();
      });
    });

    print(_allProduct.length);
  }

  /* getAllPros() async {
    _loading.value = true;
    // var dbHelper = CartDB.db;
    _allProduct = await CartDB.db.getAllPros();

    _loading.value = false;
    update();
  }*/
}
