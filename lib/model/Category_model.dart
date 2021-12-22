import 'package:flutter/material.dart';

class Category {
  var category_name;
  var category_image;

  Category({this.category_name, this.category_image});

  Category.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      print("no data found");
    } else {
      category_image = map['categoryImage'];
      category_name = map['categoryName'];
    }
  }
  toJson() {
    return {
      'categoryName': category_name,
      'categoryImage': category_image,
    };
  }
}
