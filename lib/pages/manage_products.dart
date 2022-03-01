import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/shop_drawer.dart';

import '../domain/app_state.dart';

class ManageProductsPage extends StatelessWidget {
  static const route = "/manage-products";

  const ManageProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<AppState>(context).products;
    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
        title: const Text('Manage Products'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Image(
                image: NetworkImage(products[index].imageURL),
                fit: BoxFit.cover,
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(products[index].name),
            trailing: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
