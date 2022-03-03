import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [
    Product("hamburger", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-hamburger-1.png"),
    Product("cheesburger", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-cheeseburger-1.png"),
    Product("bigmac", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-big-mac-1.png"),
    Product("whopper", 23, "test",
        "https://www.handelsblatt.com/images/der-rebel-whopper/25214366/2-formatOriginal.png"),
  ];

  List<Product> filterByFavourite(bool isFavourite) {
    if (isFavourite) {
      return products.where((product) => product.favourite).toList();
    } else {
      return products;
    }
  }

  void favoriteProduct(int index) {
    products[index].favourite = !products[index].favourite;
    notifyListeners();
  }

  Product getByIndex(int index) {
    return products[index];
  }

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void updateProduct(int index, Product product) {
    products[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    products.removeAt(index);
    notifyListeners();
  }
}
