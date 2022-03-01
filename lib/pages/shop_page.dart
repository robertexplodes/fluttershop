import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shop/widgets/shop_drawer.dart';
import 'package:shop/widgets/shop_product.dart';

import '../domain/product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => const [
                PopupMenuItem(
                  child: Text("Only Favorites"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Show All"),
                  value: 2,
                )
              ]
          ),
          IconButton(
            onPressed: () {},
            icon: Badge(
              badgeContent: Text('3'),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          5,
          (index) {
            return ShopProduct(
              product: Product("name", 23, "test",
                  "https://www.voicy.network/Content/Clips/Images/02c26932-2a2f-4fa8-921e-b5dd6b6065a9-small.png"),
            );
          },
        ),
      ),
    );
  }
}
