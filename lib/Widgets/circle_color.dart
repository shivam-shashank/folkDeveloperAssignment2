import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:folk_developers_assignment2/Models/HalfCircleColorModel.dart';
import 'package:provider/provider.dart';

class CircleColor extends StatelessWidget {
  const CircleColor({
    Key key,
    @required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 14.0),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      onTap: () => Provider.of<HalfCircleModel>(context, listen: false)
          .changeHalfCircleColor(color),
    );
  }
}
