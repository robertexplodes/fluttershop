import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> shoppingCart = [];

  void clearCart() {
    shoppingCart = [];
    notifyListeners();
  }

  void addToCart(Product product) {
    var item = shoppingCart.indexOf(product);
    if (item == -1) {
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
    if (shoppingCart.isEmpty) return 0;
    return shoppingCart
        .map((product) => product.price * product.amount)
        .reduce((value, element) => value + element);
  }

  void removeAllFromCart(int id) {
    var index = shoppingCart.indexWhere((element) => element.id == id);
    if (index != -1) {
      shoppingCart.removeAt(index);
      notifyListeners();
    }
  }

  void removeProductFromCart(Product product) {
    var index = shoppingCart.indexOf(product);
    if (index == -1) return;
    shoppingCart[index].amount--;
    if (shoppingCart[index].amount == 0) {
      shoppingCart.removeAt(index);
    }
    notifyListeners();
  }
}
