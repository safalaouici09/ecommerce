import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/MyText.dart';
import 'package:shopy/controller/HomeViewController.dart';
import 'package:shopy/Palette.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shopy/view/home/Product_view.dart';

class HomeV extends StatelessWidget {
  const HomeV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 280,
                        ),
                        Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      MyBoldText(
                        label: "What item are ",
                        color: Colors.black,
                        size: 30.0,
                      ),
                      MyBoldText(
                        label: " you looking for ? ",
                        color: Colors.black,
                        size: 30.0,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      gapPadding: 1.0,
                                      borderRadius: BorderRadius.circular(15)),
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                  ),
                                  hintText: "searching for a dress ?",
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Corange,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.search, color: Colors.white),
                          ),
                        ],
                      ),
                      MyBoldText(
                          label: "Categories ",
                          size: 20.0,
                          color: Colors.black),
                      Container(
                        height: 250,
                        child: ListView.builder(
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .categories[index].category_image),
                                        fit: BoxFit.cover),
                                  ),
                                  height: 200,
                                  width: 150,
                                ),
                                MyBoldText(
                                  label: controller
                                      .categories[index].category_name,
                                  size: 15.0,
                                  color: Colors.black87,
                                ),
                                //TODO:ANIMATION
                              ],
                            );
                          },
                        ),
                      ),
                      MyBoldText(
                          label: "Best Sellings ",
                          size: 20.0,
                          color: Colors.black),
                      Container(
                        height: 400,
                        child: ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(Product_Details_View(
                                      controller.products[index]));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: NetworkImage(controller
                                                .products[index].product_image),
                                            fit: BoxFit.cover),
                                      ),
                                      height: 200,
                                      width: 120,
                                    ),
                                    MyBoldText(
                                      label: controller
                                          .products[index].product_name,
                                      size: 20.0,
                                      color: Colors.black87,
                                    ),

                                    MyText(
                                      label: controller.products[0].price,
                                      color: Corange,
                                      size: 15.0,
                                    )

                                    //TODO:ANIMATION
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
