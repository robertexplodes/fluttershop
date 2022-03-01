import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/app_state.dart';
import 'package:shop/domain/product.dart';

class EditProduct extends StatefulWidget {
  int? index;

  EditProduct({Key? key, this.index}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Product? product;
    if (widget.index != null) {
      product = Provider.of<AppState>(context).getByIndex(widget.index!);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        actions: [
          IconButton(
            onPressed: () {
              _formKey.currentState!.validate();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("name"),
                ),
                validator: validateText,
                initialValue: product?.name,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("price"),
                ),
                validator: validateNumber,
                initialValue: product?.price.toString(),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("description"),
                ),
                validator: validateText,
                initialValue: product?.description,
                textInputAction: TextInputAction.next,
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
                      child: product != null
                          ? Image(
                              image: NetworkImage(product.imageURL),
                            )
                          : const Text('Enter a URL'),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("URL"),
                        ),
                        validator: validateText,
                        initialValue: product?.imageURL,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validateText(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter a Text.";
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return "Please enter a Number.";
    var parsed = double.tryParse(value);
    return parsed == null ? "Please enter a Number." : null;
  }
}
