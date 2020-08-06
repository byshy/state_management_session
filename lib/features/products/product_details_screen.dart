import 'package:flutter/material.dart';
import 'package:statemanagementsession/di.dart';
import 'package:statemanagementsession/features/products/products_provider.dart';
import 'package:statemanagementsession/models/product.dart';
import 'package:statemanagementsession/utils/decorations/colors.dart';
import 'package:statemanagementsession/utils/global_widgets/custom_flat_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sl<ProductsProvider>().productDetailsScaffoldKey,
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(),
                  Text(
                    '${product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                primary: false,
                children: <Widget>[
                  Container(
                    height: 250,
                    child: Placeholder(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${product.name}',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: blue495357),
                  ),
                  Divider(),
                  Text(
                    '${product.details}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ],
          ),
          Positioned.fill(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00FFFFFF),
                    Colors.white,
                  ],
                ),
              ),
            ),
            top: null,
          ),
        ],
      ),
      bottomNavigationBar: CustomFlatButton(
        child: Text(
          'ADD TO BAG',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          sl<ProductsProvider>().addToCart(product);
        },
      ),
    );
  }
}
