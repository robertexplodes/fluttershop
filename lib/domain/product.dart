class Product {
  String name;
  double price;
  String description;
  String imageURL;
  int amount = 0;
  bool favourite = false;

  Product(this.name, this.price, this.description, this.imageURL);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          description == other.description &&
          imageURL == other.imageURL &&
          favourite == other.favourite;

  @override
  int get hashCode =>
      name.hashCode ^
      price.hashCode ^
      description.hashCode ^
      imageURL.hashCode ^
      favourite.hashCode;
}
