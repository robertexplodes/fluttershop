import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/order.dart';
import 'package:shop/domain/provider/order_provider.dart';
import 'package:shop/domain/provider/product_provider.dart';
import 'package:shop/domain/product.dart';
import 'package:shop/domain/provider/cart_provider.dart';
import 'package:shop/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartProvider>(context).shoppingCart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                const Text('Total', style: TextStyle(fontSize: 20)),
                const Spacer(),
                Chip(
                  label: Text(
                    '€ ${Provider.of<CartProvider>(context).totalPrice}',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                TextButton(
                  onPressed: () {
                    var content = Provider.of<CartProvider>(context, listen: false).shoppingCart;
                    Provider.of<CartProvider>(context, listen: false).clearCart();
                    Provider.of<OrderProvider>(context, listen: false)
                        .addOrder(Order(DateTime.now(), content));
                  },
                  child: const Text('Order now'),
                ),
              ]),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return CartItem(product: products[index]);
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
