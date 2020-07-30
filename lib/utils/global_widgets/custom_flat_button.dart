import 'package:flutter/material.dart';
import 'package:statemanagementsession/utils/decorations/colors.dart';

class CustomFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomFlatButton({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 28.0),
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
          height: 60,
          child: Center(
            child: Row(
              children: <Widget>[
                child,
                Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: blue253952,
      ),
    );
  }
}
