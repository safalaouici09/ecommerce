import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/MyText.dart';
import 'package:shopy/controller/HomeViewController.dart';
import 'package:shopy/Palette.dart';
import 'package:shopy/view/home/Product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return GetBuilder<HomeViewController>(
      init: HomeViewController(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Scaffold(
              drawer: NavDrawer(),
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 200,
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
                        label: "Categories ", size: 20.0, color: Colors.black),
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
                                label:
                                    controller.categories[index].category_name,
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
                                print("iiiiiffddddd");
                                print(controller.products[index].product_id);
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
                                    label:
                                        controller.products[index].product_name,
                                    size: 20.0,
                                    color: Colors.black87,
                                  ),
                                  MyText(
                                    label: controller.products[index].price,
                                    color: Corange,
                                    size: 15.0,
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              // bottomNavigationBar: NavBar(),
            )),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/profile.jpg'))),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    MyBoldText(
                      label: "Safa Laouici",
                      size: 15.0,
                      color: Colors.black,
                    ),
                    MyText(
                      label: "Safa@gmail.com",
                      size: 15.0,
                      color: Colors.black38,
                    )
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: MyText(
              label: "favorite",
              size: 20.0,
              color: Colors.black,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: MyText(
              label: "profile",
              size: 20.0,
              color: Colors.black,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: MyText(
              label: "Settings",
              size: 20.0,
              color: Colors.black,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: MyText(
              label: "Feedbacks",
              size: 20.0,
              color: Colors.black,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: MyText(
              label: "Logout",
              size: 20.0,
              color: Colors.black,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
