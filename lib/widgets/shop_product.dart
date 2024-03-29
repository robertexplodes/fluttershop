import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/provider/product_provider.dart';
import 'package:shop/domain/product.dart';
import 'package:shop/domain/provider/cart_provider.dart';
import 'package:shop/pages/cart_page.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(
                  product.favourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.orange,
                ),
                onPressed: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .favoriteProduct(product.id);
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
        image: DecorationImage(
          image: Image.network(
            product.imageURL,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Image.asset("assets/images/404.jpg"),
              );
            },
          ).image,
         ),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   color: Colors.blue,
      //   image: DecorationImage(
      //     image: CachedNetworkImageProvider(
      //       product.imageURL,
      //       // imageUrl:product.imageURL,
      //       // placeholder: (context, url) => const CircularProgressIndicator(color: Colors.blue),
      //       // errorWidget: (context, url, error) => const Icon(Icons.error),
      //     ),
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }

  void handleAddToCart(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false)
                .removeProductFromCart(product);
          },
        ),
        content: Text(
          '${product.name} added.',
        ),
      ),
    );
  }
}
