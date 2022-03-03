import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: CircleAvatar(child: Text('€ ${product.price}', style: TextStyle(fontSize: 12),)),
          title: Text(product.name),
          subtitle: Text('Total: € ${product.price * product.amount}'),
          trailing: Text('${product.amount}x'),
        ),
      ),
    );
  }
}
