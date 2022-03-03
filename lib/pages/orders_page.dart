import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/provider/order_provider.dart';
import 'package:shop/widgets/order_widget.dart';
import 'package:shop/widgets/shop_drawer.dart';

class OrderPage extends StatelessWidget {
  static const route = "/order-page";

  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<OrderProvider>(context).orders;
    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return OrderWidget(order: orders[index]);
        },
        itemCount: orders.length,
      ),
    );
  }
}
