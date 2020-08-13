import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagementsession/di.dart';
import 'package:statemanagementsession/models/product.dart';
import 'package:statemanagementsession/services/navigation_service.dart';
import 'package:statemanagementsession/utils/routing/routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: () {
          sl<NavigationService>().navigateTo(
            productDetails,
            args: [
              product,
            ],
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              child: Placeholder(),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(
                      child: Text(
                        '${product.name}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                  ]),
                  Spacer(),
                  Row(children: <Widget>[
                    Expanded(
                      child: Text(
                        'USD${product.price}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
