import 'package:flutter/material.dart';

class SnackBarErrorMessage extends StatelessWidget {
  final String message;

  const SnackBarErrorMessage({Key key, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.remove_circle,
          color: Colors.red,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(message),
        ),
      ],
    );
  }
}
