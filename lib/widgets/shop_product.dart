import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/app_state.dart';
import 'package:shop/domain/product.dart';

class ShopProduct extends StatelessWidget {
  final Product product;
  final int index;

  const ShopProduct({Key? key, required this.index, required this.product})
      : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(
                  product.favourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.orange,
                ),
                onPressed: () {
                  Provider.of<AppState>(context, listen: false)
                      .favoriteProduct(index);
                },
              ),
              Flexible(
                child: Text(
                  product.name,
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.orange,
                ),
                onPressed: () {
                  handleAddToCart(context);
                },
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

  void handleAddToCart(BuildContext context) {
    Provider.of<AppState>(context, listen: false)
        .addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            Provider.of<AppState>(context, listen: false)
                .removeFromCart(product);
          },
        ),
        content: Text('${product.name} added.',),
      ),
    );
  }
}
