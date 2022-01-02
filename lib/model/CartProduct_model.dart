import 'package:flutter/cupertino.dart';

class CartProduct {
  // Category category;
  //String id
  var product_name;
  var product_image;
  var price;
  var quantity;

  CartProduct({
    this.product_image,
    this.product_name,
    this.price,
    this.quantity,
  });
  fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      print("no data found");
    } else {
      product_image = map['image'];
      product_name = map['name'];
      price = map['price'];
      quantity = map['quantity'];
    }
  }

  toJson() {
    return {
      'name': product_name,
      'image': product_image,
      'price': price,
      'quantity': quantity
    };
  }
}
