import 'package:flutter/material.dart';
import 'package:shop/widgets/shop_drawer.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShopDrawer(),
      appBar: AppBar(

      ),
    );
  }
}
