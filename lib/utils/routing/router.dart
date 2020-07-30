import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementsession/features/cart/cart_provider.dart';
import 'package:statemanagementsession/features/cart/cart_screen.dart';
import 'package:statemanagementsession/features/products/product_details_screen.dart';
import 'package:statemanagementsession/features/products/products_provider.dart';
import 'package:statemanagementsession/features/products/products_screen.dart';

import '../../di.dart';
import 'routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case products:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            child: ProductsScreen(),
            value: sl<ProductsProvider>(),
          ),
        );
      case productDetails:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            child: ProductDetailsScreen(
              product: (settings.arguments as List)[0],
            ),
            value: sl<ProductsProvider>(),
          ),
        );
      case cart:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            child: CartScreen(),
            value: sl<CartProvider>(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
