import 'package:flutter/material.dart';
import 'package:shop/domain/product.dart';

class EditForm extends StatefulWidget {
  Product? product;
  EditForm({Key? key, this.product}) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("name"),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("price"),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("description"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 100,
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 100,
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  child: widget.product != null
                      ? Image(
                    image: NetworkImage(widget.product!.imageURL),
                  )
                      : const Text('Enter a URL'),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("URL"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
