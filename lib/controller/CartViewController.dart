import 'package:get/get.dart';

class CartViewController extends GetxController {
  int get quantity => _quantity;
  int _quantity = 1;

  addQuantity() {
    _quantity++;
    print(_quantity);
  }

  minQuantity() {
    _quantity--;
    print(_quantity);
  }
}
