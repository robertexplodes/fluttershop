import 'package:flutter/cupertino.dart';
import 'package:shop/domain/product.dart';

class AppState with ChangeNotifier {
  List<Product> products = [
    Product("name", 23, "test",
        "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4LqQX?ver=1f00"),
    Product("hamburger", 23, "test",
        "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4LqQX?ver=1f00"),
    Product("cheeseburger", 23, "test",
        "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4LqQX?ver=1f00"),
  ];

  void favoriteProduct(int index) {
    products[index].favourite = !products[index].favourite;
    notifyListeners();
  }

  Product getByIndex(int index) {
    return products[index];
  }
}
