import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagementsession/di.dart';
import 'package:statemanagementsession/features/cart/cart_provider.dart';
import 'package:statemanagementsession/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({Key key, this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${cartItem.product.name}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'USD${cartItem.product.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        sl<CartProvider>()
                            .decrementItem(productId: cartItem.product.id);
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                    Text('${cartItem.quantity}'),
                    FlatButton(
                      onPressed: () {
                        sl<CartProvider>()
                            .incrementItem(productId: cartItem.product.id);
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
