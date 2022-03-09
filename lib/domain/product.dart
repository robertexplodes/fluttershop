class Product {
  String name;
  double price;
  String description;
  String imageURL;
  int amount = 0;
  bool favourite = false;
  int id;
  static int _lastId = 1;

  Product(this.id, this.name, this.price, this.description, this.imageURL);

  static int getNextId() {
    return _lastId++;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
