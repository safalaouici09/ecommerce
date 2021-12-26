import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/HomeViewController.dart';
import 'package:shopy/model/Product_model.dart';
import 'package:shopy/Palette.dart';
import 'package:shopy/model/Category_model.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shopy/view/home/Product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _index = 0;
  Product shoe = Product(
      product_image: Image.asset('assets/chaussure.jpg'),
      product_name: "man shoe");
  Category shoes = Category(
      category_name: "Shoes",
      category_image: Image.asset(
        'assets/chaussures.jpg',
        height: 200,
        width: 200,
        fit: BoxFit.fill,
      ));

  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Text(
                      "categories ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(controller
                                      .categories[index].category_image),
                                  fit: BoxFit.cover),
                            ),
                            height: 80,
                            width: 200,
                            child: Text(
                              controller.categories[index].category_name,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Best Sellings ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(
                        height: 250,
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    //   color: Cgris,
                                  ),
                                  height: 100,
                                  width: 100,
                                  child: Stack(children: [
                                    Image.network(controller
                                        .products[index].product_image),
                                    Text(controller
                                        .products[index].product_name),
                                  ]),
                                ),
                                onTap: () {
                                  Get.to(Product_Details_View(
                                      controller.products[index]));
                                },
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: FloatingNavbar(
                backgroundColor: CdarkBlue,
                selectedBackgroundColor: CdarkBlue,
                selectedItemColor: Corange,
                onTap: (int val) => setState(() => _index = val),
                currentIndex: _index,
                items: [
                  FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                  FloatingNavbarItem(icon: Icons.shopping_cart, title: 'Cart'),
                  // FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
                  FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
                ],
              ),
            )),
    );
  }
}
