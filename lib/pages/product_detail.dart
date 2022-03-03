import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Image.network(product.imageURL),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              '€ ${product.price.toString()}',
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Text(product.description),
        ],
      ),
    );
  }
}
