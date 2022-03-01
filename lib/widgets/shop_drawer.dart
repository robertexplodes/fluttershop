import 'package:flutter/material.dart';
import 'package:shop/pages/manage_products.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/widgets/drawer_item.dart';

class ShopDrawer extends StatelessWidget {
  const ShopDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Shop, Orders, Manage products
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "Shop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const DrawerItem(
            icon: Icons.shop,
            text: 'Shop',
            route: "/",
          ),
          const DrawerItem(
            icon: Icons.credit_card,
            text: 'Orders',
            route: OrderPage.route,
          ),
          const DrawerItem(
            icon: Icons.edit,
            text: 'Manage products',
            route: ManageProductsPage.route,
          ),
        ],
      ),
    );
  }
}
