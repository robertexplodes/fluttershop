import 'package:flutter/material.dart';
import 'package:shop/widgets/shop_drawer.dart';

class OrderPage extends StatelessWidget {
  static const route = "/order-page";

  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        title: const Text('Orders'),
      ),
    );
  }
}
