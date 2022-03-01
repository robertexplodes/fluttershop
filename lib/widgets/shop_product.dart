import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class ShopProduct extends StatelessWidget {
  final Product product;

  const ShopProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: const Color.fromRGBO(0, 0, 0, 0.7),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.favorite_border, color: Colors.orange),
              Text(
                product.name,
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
      height: 190.0,
      width: MediaQuery.of(context).size.width - 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
        image: DecorationImage(
          image: NetworkImage(product.imageURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
