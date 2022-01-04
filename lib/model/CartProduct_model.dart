import 'package:flutter/material.dart';

class CartProduct {
  String name = "";
  String image = "";
  String price = "";
  int quantity = 0;

  CartProduct(String name, String image, String price, int quantity) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
    this.image = image;
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'image': image, 'price': price, 'quantity': quantity};
  }
}
