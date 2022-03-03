import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/pages/edit_product.dart';
import 'package:shop/widgets/shop_drawer.dart';

import '../domain/provider/product_provider.dart';

class ManageProductsPage extends StatelessWidget {
  static const route = "/manage-products";

  const ManageProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditProduct(),
            ));
          }, icon: const Icon(Icons.add)),
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
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditProduct(index: index),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<ProductProvider>(context, listen: false).deleteProduct(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
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
