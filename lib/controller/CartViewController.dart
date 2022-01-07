import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopy/Services/database/CartDB.dart';
import 'package:shopy/model/CartProduct_model.dart';

class CartViewController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProduct> get cartProducts => _cartProducts;

  var _cartProducts = <CartProduct>[];
  @override
  CartViewController() {
    _getData();
  }

  void _getData() async {
    _loading.value = true;
    await DatabaseHelper.instance.queryAllRows().then((value) {
      value.forEach((element) {
        _cartProducts.add(CartProduct(element['id'], element['name'],
            element['image'], element['price'], element['quantity']));
      });
    });
    _loading.value = false;
    update();
  }

  void addData(CartProduct cartProduct) async {
    _loading.value = true;
    //the product is added
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProduct.id == cartProducts[i].id) {
        return;
      }
    }
    //the product wasn't added to card before

    await DatabaseHelper.instance.insert(cartProduct);

    _loading.value = false;
    update();
  }

  addQuantity(CartProduct cartProduct) async {
    cartProduct.addQuantity();
    await DatabaseHelper.instance.update(cartProduct);

    update();
  }

  minQuantity(CartProduct cartProduct) {
    cartProduct.minQuantity();

    update();
  }
}
