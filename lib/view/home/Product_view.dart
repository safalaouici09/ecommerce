import 'package:flutter/material.dart';
import 'package:shopy/Palette.dart';
import 'package:shopy/controller/CartViewController.dart';
import 'package:shopy/model/CartProduct_model.dart';
import 'package:shopy/model/Product_model.dart';
import 'package:shopy/view/auth/SignUp.dart';
import 'package:get/get.dart';
import 'package:shopy/view/cart/cart.dart';

class Product_Details_View extends StatelessWidget {
  Product product; // =Product(product_name: "",product_image: "");
  Product_Details_View(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(this.product.product_image),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xBF000000)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      this.product.product_name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "dskdhbvjhdscwkjnxqbwgnhfkyuvifoddskdhbvjhdscwkjnxqbwgnhfkyuvifodpdskdhbvjhdscwkjnxqbwgnhfkyuvifodpqskljwxhbceziuopawx;,:df",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      this.product.price,
                      style: TextStyle(color: Corange),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // color: Color(product.color),
                          ),
                        )
                      ],
                    ),
                    Text(
                      this.product.size,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    GetBuilder<CartViewController>(
                        init: CartViewController(),
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () {
                              controller.addData(CartProduct(
                                  this.product.product_name,
                                  this.product.product_image,
                                  this.product.price,
                                  5));
                              // Get.to(Screen());
                            },
                            child: ColoredContainer(
                              text: "Add to bag",
                              color: Corange,
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
