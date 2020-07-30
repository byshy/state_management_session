class Product {
  int id;
  double price;
  String name;
  String details;

  Product({
    this.id,
    this.price,
    this.name,
    this.details,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['name'] = this.name;
    data['details'] = this.details;
    return data;
  }

  @override
  String toString() {
    return 'id: $id, name: $name, price: $price';
  }
}
