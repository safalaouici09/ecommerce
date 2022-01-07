import 'package:flutter/material.dart';
import 'package:shopy/Palette.dart';
import 'package:get/get.dart';
import 'package:shopy/MyText.dart';
import 'package:shopy/controller/CartViewController.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart_View extends StatelessWidget {
  const Cart_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Product> products = <Product>[product1, product2, product3];
    return GetBuilder<CartViewController>(
        init: CartViewController(),
        builder: (controller) {
          if (controller.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.cartProducts.length == 0) {
            return (Center(
              child: Container(
                height: 300.0,
                width: 300.0,
                child: SvgPicture.asset(
                  'assets/emptyCart.svg',
                  fit: BoxFit.fill,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ));
          } else
            return Scaffold(
              body: ListView.builder(
                  itemCount: controller.cartProducts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                              // border: BoxBorder(),
                              borderRadius: BorderRadius.circular(15),
                              /*image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            controller.allProduct[index].product_image,
                          ),
                        ),*/
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyText(
                                  label: controller.cartProducts[index].name,
                                  color: Colors.black,
                                  size: 25.00,
                                  weight: FontWeight.bold,
                                ),
                                Text(
                                    "Size : " // + controller.allProduct[index].size,
                                    ),
                                SizedBox(
                                  //Places des couleurs
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      label: controller
                                          .cartProducts[index].price
                                          .toString(),
                                      color: Corange,
                                      size: 18.00,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.minQuantity(
                                          controller.cartProducts[index]),
                                      child: Circular(
                                        icon: Icons.minimize,
                                      ),
                                    ),
                                    Text(controller.cartProducts[index].quantity
                                        .toString()),
                                    GestureDetector(
                                      onTap: () => controller.addQuantity(
                                          controller.cartProducts[index]),
                                      child: Circular(
                                        icon: Icons.add,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
        });
  }
}

class Circular extends StatelessWidget {
  var icon;
  Circular({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Icon(
          icon,
          size: 16,
        )),
      ),
    );
  }
} //
//
