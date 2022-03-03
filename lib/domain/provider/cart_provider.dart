import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> shoppingCart = [];

  void addToCart(Product product) {
    var item = shoppingCart.indexOf(product);
    if(item == -1) {
      product.amount = 1;
      shoppingCart.add(product);
    } else {
      shoppingCart[item].amount++;
    }
    notifyListeners();
  }

  int get cartLength {
    return shoppingCart.length;
  }

  double get totalPrice {
    return shoppingCart
        .map((product) => product.price * product.amount)
        .reduce((value, element) => value + element);
  }


  void removeFromCart(Product product) {
    var item = shoppingCart.indexOf(product);
    if(item != -1) {
      shoppingCart[item].amount--;
      if(shoppingCart[item].amount == 0) {
        shoppingCart.removeAt(item);
      }
    }
    notifyListeners();
  }
}