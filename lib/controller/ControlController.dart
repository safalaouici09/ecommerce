import 'package:flutter/cupertino.dart';
import 'package:shopy/model/Product_model.dart';
import 'package:get/get.dart';
import 'package:shopy/view/home/home_view.dart';
import 'package:shopy/view/cart/cart_view.dart';

class ControllController extends GetxController {
  Widget get currentScreen => _currentScreen;
  Widget _currentScreen = HomeView();
  int _navigationIndex = 0;
  get navigationIndex => _navigationIndex;
  getbutom(int selectedValue) {
    _navigationIndex = selectedValue;
     switch(selectedValue) { 
   case 0: { 
      _currentScreen = HomeView();
      break;
   } 
   break; 
  
   case 1: { 
      _currentScreen  = Cart_View();
   } 
   break; 
      
   default: { 
       _currentScreen = HomeView(); 
   }
   break; 
}
    
    update();
  }
}
