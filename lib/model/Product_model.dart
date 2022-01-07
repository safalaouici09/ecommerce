import 'package:flutter/cupertino.dart';

class Product {
  // Category category;
  //String id
  var product_id;
  var product_name;
  var product_image;
  var price;
  var size;
  var color;
  var sexe;
  Product(
      {this.product_id,
      this.product_image,
      this.product_name,
      this.price,
      this.size,
      this.color,
      this.sexe});
  Product.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      print("no data found");
    } else {
      product_image = map['productImage'];
      product_name = map['productName'];
    }
  }
  toJson() {
    return {
      'productName': product_name,
      'productImage': product_image,
    };
  }
}
