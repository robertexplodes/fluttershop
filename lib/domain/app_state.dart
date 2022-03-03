import 'package:flutter/cupertino.dart';
import 'package:shop/domain/product.dart';

class AppState with ChangeNotifier {
  List<Product> products = [
    Product("hamburger", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-hamburger-1.png"),
    Product("cheesburger", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-cheeseburger-1.png"),
    Product("bigmac", 23, "test",
        "https://www.mcdonalds.at/wp-content/uploads/2021/09/web-neu-1500x1500-core-big-mac-1.png"),
    Product("whopper", 23, "test",
        "https://banner2.cleanpng.com/20180131/afq/kisspng-whopper-hamburger-cheeseburger-burger-king-premium-fast-food-burger-5a725b35edda78.0012443215174438939743.jpg"),
  ];

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
