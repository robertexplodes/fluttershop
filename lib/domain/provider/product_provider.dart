import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [
    Product(Product.getNextId(), "hamburger", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-hamburger-1.png"),
    Product(Product.getNextId(), "cheesburger", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-cheeseburger-1.png"),
    Product(Product.getNextId(), "bigmac", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-big-mac-1.png"),
    Product(Product.getNextId(), "whopper", 23, "test",
        "https://www.handelsblatt.com/images/der-rebel-whopper/25214366/2-formatOriginal.png"),
  ];

  List<Product> filterByFavourite(bool isFavourite) {
    if (isFavourite) {
      return products.where((product) => product.favourite).toList();
    } else {
      return products;
    }
  }

  void favoriteProduct(int id) {
    var index = products.indexOf(products.firstWhere((product) => product.id == id));
    if(index == -1) {
      return;
    }
    products[index].favourite = !products[index].favourite;
    notifyListeners();
  }

  Product getById(int id) {
    return products.firstWhere((product) => product.id == id);
  }

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void updateProduct(Product product) {
    var inList = products.indexOf(product);
    if(inList == -1) {
      return;
    }
    products[inList] = product;
    notifyListeners();
  }

  void deleteProduct(int id) {
    var inList = products.indexWhere((product) => product.id == id);
    if(inList == -1) {
      return;
    }
    products.removeAt(inList);
    notifyListeners();
  }
}
