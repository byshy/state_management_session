class ProductList {
  List<Product> productsList;

  ProductList({this.productsList});

  ProductList.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      productsList = new List<Product>();
      json['products'].forEach((v) {
        productsList.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsList != null) {
      data['products'] = this.productsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int id;
  String name;
  String price;
  String image;

  Product({this.id, this.name, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
