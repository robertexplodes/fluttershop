import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/domain/order.dart';

class OrderWidget extends StatelessWidget {
  final Order order;

  const OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '€ ${order.total}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(DateFormat('dd.MM.yyy HH:mm').format(order.date)),
              ),
            ],
          ),
        ),
        expanded: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              order.products.length,
              (index) {
                return Row(
                  children: [
                    Text(
                      order.products[index].name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                      ' ${order.products[index].amount}x ',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '€ ${order.products[index].price}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        collapsed: const SizedBox.shrink(),
      ),
    );
  }
}
