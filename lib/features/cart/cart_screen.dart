import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementsession/di.dart';
import 'package:statemanagementsession/features/cart/cart_provider.dart';
import 'package:statemanagementsession/models/cart_item.dart';
import 'package:statemanagementsession/utils/global_widgets/cart_item.dart';
import 'package:statemanagementsession/utils/global_widgets/custom_flat_button.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, instance, child) {
        return Scaffold(
          key: sl<CartProvider>().scaffoldKey,
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    '${instance.itemsCount} ${instance.itemsCount > 1 ? 'items' : 'item'}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Cart',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(),
                  Text('\$${instance.totalPrice.toStringAsFixed(2)}'),
                ],
              ),
              SizedBox(height: 20),
              Consumer<CartProvider>(
                builder: (_, instance, child) {
                  return cartItemsBuilder(items: instance.cartItems);
                },
              ),
            ],
          ),
          bottomNavigationBar: CustomFlatButton(
            child: Text(
              'Proceed to checkout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        );
      },
    );
  }

  Widget cartItemsBuilder({List<CartItem> items}) {
    if (items.isEmpty) {
      return Text('No Items Added Yet');
    }

    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: items.length,
      separatorBuilder: (_, index) {
        return Divider();
      },
      itemBuilder: (_, index) {
        return CartItemWidget(
          cartItem: items[index],
        );
      },
    );
  }
}
