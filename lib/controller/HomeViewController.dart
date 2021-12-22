import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopy/model/Category_model.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeViewController extends GetxController {
  List<Category> get categories => _categories;
  List<Category> _categories = <Category>[];

  HomeViewController() {
    getData();
  }
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection("categories");

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
  /*
  getCategory() async {
    /*QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('categories').get();
    List docs = snapshot.docs;
    docs.forEach((doc) {
      print("//////////////------sss");
      print(doc.id);
    });*/
    _categoriesRef.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        print("********");
        print(value.docs[i].data());
        print("********");
        _categories.add(
            Category.fromjson(value.docs[i].data() as Map<dynamic, dynamic>));
      }
      print("//////////////");
      print(_categories);
    });
    update();
  }*/
}
