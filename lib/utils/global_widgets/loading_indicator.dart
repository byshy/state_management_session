import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double value;
  final double stroke;

  const LoadingIndicator(
      {Key key, this.color, this.value, this.backgroundColor, this.stroke})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: stroke ?? 3,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
