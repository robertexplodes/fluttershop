import 'package:flutter/material.dart';
import 'package:shop/widgets/shop_drawer.dart';

class ManageProductsPage extends StatelessWidget {

  static const route = "/manage-products";

  const ManageProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShopDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.add)),
        ],
        title: const Text('Manage Products'),
      ),
    );
  }
}
