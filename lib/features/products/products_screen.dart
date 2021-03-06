import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementsession/di.dart';
import 'package:statemanagementsession/features/products/products_provider.dart';
import 'package:statemanagementsession/services/navigation_service.dart';
import 'package:statemanagementsession/utils/global_widgets/product_item.dart';
import 'package:statemanagementsession/utils/routing/routes.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    sl<ProductsProvider>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              sl<NavigationService>().navigateTo(cart);
            },
          ),
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (_, instance, child) {
          if (instance.loading) {
            return CircularProgressIndicator();
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            itemCount: instance.products.productsList.length,
            separatorBuilder: (_, index) {
              return SizedBox(height: 10);
            },
            itemBuilder: (_, index) {
              return ProductItem(
                product: instance.products.productsList[index],
              );
            },
          );
        },
      ),
    );
  }
}
