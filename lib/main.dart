import 'package:flutter/material.dart';
import 'package:shop/pages/manage_products.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/shop_page.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ShopPage(),
        ManageProductsPage.route: (context) => const ManageProductsPage(),
        OrderPage.route: (context) => const OrderPage(),
      },
    );
  }
}
