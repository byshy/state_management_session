import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagementsession/models/cart_item.dart';
import 'package:statemanagementsession/models/product.dart';

class CartProvider with ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<CartItem> _cartItems = List();

  List<CartItem> get cartItems => _cartItems;

  double totalPrice = 0;
  int itemsCount = 0;

  void addToCart(Product product) {
    int index =
        _cartItems.indexWhere((element) => element.product.id == product.id);
    print('index: $index');
    if (index > -1) {
      incrementItem(productId: product.id);
    } else {
      _cartItems.add(
        CartItem(
          quantity: 1,
          product: product,
        ),
      );
      totalPrice += double.parse(product.price);
      itemsCount += 1;
    }
    notifyListeners();
  }

  void incrementItem({int productId}) {
    int index =
        _cartItems.indexWhere((element) => element.product.id == productId);
    CartItem temp = _cartItems[index];
    temp.quantity += 1;
    _cartItems[index] = temp;
    totalPrice += double.parse(temp.product.price);
    itemsCount += 1;
    notifyListeners();
  }

  void decrementItem({int productId}) {
    int index =
        _cartItems.indexWhere((element) => element.product.id == productId);
    CartItem temp = _cartItems[index];
    if (temp.quantity > 1) {
      temp.quantity -= 1;
      totalPrice -= double.parse(temp.product.price);
      itemsCount -= 1;
      _cartItems[index] = temp;
      notifyListeners();
    } else {
      showDialog(
        context: scaffoldKey.currentContext,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete item'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('CANCEL'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  _cartItems.removeAt(index);
                  totalPrice -= double.parse(temp.product.price);
                  itemsCount -= 1;
                  notifyListeners();
                },
                child: Text('DELETE'),
              ),
            ],
          );
        },
      );
    }
  }
}
