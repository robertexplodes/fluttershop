import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/pages/product_detail.dart';
import 'package:shop/widgets/shop_drawer.dart';
import 'package:shop/widgets/shop_product.dart';

import '../domain/app_state.dart';

enum FilterOptions {
  favorites,
  all,
}

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  var showFavourites = false;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<AppState>(context).filterByFavourite(showFavourites);
    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if(value == null) return;
              if(value == FilterOptions.favorites) {
                setState(() {
                  showFavourites = true;
                });
              } else if(value == FilterOptions.all) {
                setState(() {
                  showFavourites = false;
                });
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FilterOptions.favorites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.all,
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
