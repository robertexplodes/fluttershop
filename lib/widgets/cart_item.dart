import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/product.dart';
import 'package:shop/domain/provider/cart_provider.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int index;
  const CartItem({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Dismissible(
        key: GlobalKey(),
        child: Card(
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
                child: Text(
              '€ ${product.price}',
              style: TextStyle(fontSize: 12),
            )),
            title: Text(product.name),
            subtitle: Text('Total: € ${product.price * product.amount}'),
            trailing: Text('${product.amount}x'),
          ),
        ),
        background: Container(
          child: Icon(Icons.delete, color: Colors.white),
          color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(16),
        ),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          Provider.of<CartProvider>(context, listen: false)
              .removeAllFromCart(index);
        },
      ),
    );
  }
}
