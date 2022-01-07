import 'package:flutter/material.dart';

class CartProduct {
  String id = "";
  String name = "";
  String image = "";
  String price = "";
  int quantity = 0;

  CartProduct(
      String id, String name, String image, String price, int quantity) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.quantity = quantity;
    this.image = image;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity
    };
  }

  addQuantity() {
    this.quantity++;
  }

  minQuantity() {
    if (this.quantity == 0) {
      return;
    } else {
      this.quantity--;
    }
  }
}
