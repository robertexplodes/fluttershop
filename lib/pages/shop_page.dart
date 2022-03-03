import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/pages/product_detail.dart';
import 'package:shop/widgets/shop_drawer.dart';
import 'package:shop/widgets/shop_product.dart';

import '../domain/app_state.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<AppState>(context).products;
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
            ],
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
          products.length,
          (index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: products[index]),
                ),
              ),
              child: ShopProduct(
                index: index,
                product: products[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
