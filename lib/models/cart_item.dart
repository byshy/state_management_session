import 'package:statemanagementsession/models/product.dart';

class CartItem {
  int quantity;
  Product product;

  CartItem({
    this.quantity,
    this.product,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['product'] = this.product;
    return data;
  }

  @override
  String toString() {
    return 'quantity: $quantity, product: (${product.id}, ${product.name})';
  }
}
