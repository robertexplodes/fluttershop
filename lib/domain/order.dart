import 'package:shop/domain/product.dart';

class Order {
  DateTime date;
  List<Product> products;

  Order(this.date, this.products);

  double get total => products
      .map((product) => product.price * product.amount)
      .reduce((a, b) => a + b);
}