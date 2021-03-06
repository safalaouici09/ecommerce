import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopy/view/home/home_view.dart';
//import 'package:shopy/view/cart/cart.dart';
import 'package:shopy/model/Category_model.dart';
import 'package:shopy/model/Product_model.dart';

class HomeViewController extends GetxController {
  List<Category> get categories => _categories;
  List<Category> _categories = <Category>[];
  List<Product> get products => _products;
  List<Product> _products = <Product>[];
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  int _navigationIndex = 0;
  get navigationIndex => _navigationIndex;

  HomeViewController() {
    getCategory();
    getProduct();
  }

  getCategory() async {
    _loading.value = true;
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('categories').get();
    List docs = snapshot.docs;

    docs.forEach((doc) {
      Category category = new Category(
          category_name: doc["categoryName"],
          category_image: doc["categoryImage"]);
      _categories.add(category);
    });
    _loading.value = false;
    update();
  }

  getProduct() async {
    _loading.value = true;
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    List docs = snapshot.docs;

    docs.forEach((doc) {
      Product product = new Product(
          product_id: doc["productId"],
          product_name: doc["productName"],
          product_image: doc["productImage"],
          price: doc["productPrice"],
          color: doc["productColor"],
          size: doc["productSize"]);
      _products.add(product);
    });
    _loading.value = false;
    update();
  }

  getbutom(int selectedValue) {
    _navigationIndex = selectedValue;
    update();
  }
}
