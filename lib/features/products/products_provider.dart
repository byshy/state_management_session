import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagementsession/data/api_repo.dart';
import 'package:statemanagementsession/di.dart';
import 'package:statemanagementsession/features/cart/cart_provider.dart';
import 'package:statemanagementsession/models/product.dart';
import 'package:statemanagementsession/services/navigation_service.dart';
import 'package:statemanagementsession/utils/routing/routes.dart';

class ProductsProvider with ChangeNotifier {
  final GlobalKey<ScaffoldState> productDetailsScaffoldKey = GlobalKey();

  ProductList products = ProductList(productsList: List());

//  List<Product> products = List.generate(
//    7,
//    (index) => Product(
//      id: index,
//      name: 'product #$index',
//      price: Random.secure().nextDouble() * 500,
//      details:
//          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
//eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
//veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
//consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
//cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
//non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
//    ),
//  );

  bool loading = false;

  void getProducts() {
    loading = true;
    notifyListeners();
    print('getProducts');
    if (products.productsList.isEmpty) {
      sl<ApiRepo>().getProducts().then((value) {
        loading = false;
        notifyListeners();
        print('value: ${value.toString()}');
        products = value;
        notifyListeners();
      });
    }
  }

  void addToCart(Product product) {
    sl<CartProvider>().addToCart(product);
    showDialog(
        context: productDetailsScaffoldKey.currentContext,
        builder: (context) {
          return AlertDialog(
            title: Text('Item added Successfully'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('CLOSE'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  sl<NavigationService>().navigateTo(cart);
                },
                child: Text('CHECK CART'),
              ),
            ],
          );
        });
  }
}
