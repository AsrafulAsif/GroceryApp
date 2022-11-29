import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItem = [
    //[item name,itemprice,imagepath,color]
    ['Avocado', '4.00', 'lib/images/avocado.png', Colors.green],
    ['Banana', '2.50', 'lib/images/banana.png', Colors.yellow],
    ['Chicken', '5.00', 'lib/images/chicken.png', Colors.brown],
    ['Water', '2.00', 'lib/images/water.png', Colors.blue],
  ];

    //wishing message
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  final String name = 'AsrafulAsif';
  get shopItems => _shopItem;
  get userName => name;
}
