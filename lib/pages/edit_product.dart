import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/provider/product_provider.dart';
import 'package:shop/domain/product.dart';

class EditProduct extends StatefulWidget {
  int? productId;

  EditProduct({Key? key, this.productId}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  var imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Product? product;
    if (widget.productId != null) {
      product = Provider.of<ProductProvider>(context).getById(widget.productId!);
      nameController.text = product.name;
      priceController.text = product.price.toString();
      descriptionController.text = product.description;
      imageUrlController.text = product.imageURL;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        actions: [
          IconButton(
            onPressed: () {
              handleSave(context);
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
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("price"),
                ),
                validator: validateNumber,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: priceController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("description"),
                ),
                validator: validateText,
                textInputAction: TextInputAction.next,
                controller: descriptionController,
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
                        controller: imageUrlController,
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

  void handleSave(BuildContext context) {
    _formKey.currentState!.validate();
    var price = double.parse(priceController.text);
    if (widget.productId != null) {
      Provider.of<ProductProvider>(context, listen: false).updateProduct(
          Product(widget.productId!, nameController.text, price,
              descriptionController.text, imageUrlController.text));
    } else {
      Provider.of<ProductProvider>(context, listen: false).addProduct(Product(
        Product.getNextId(),
        nameController.text,
        price,
        descriptionController.text,
        imageUrlController.text,
      ));
    }
    Navigator.of(context).pop();
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
