import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScenesContainer extends StatelessWidget {
  const ScenesContainer({
    Key key,
    @required this.text,
    @required this.gradientColors,
  }) : super(key: key);

  final String text;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    final screenDim = MediaQuery.of(context).size;

    return Container(
      width: screenDim.width * .4,
      height: screenDim.height * .07,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 22.0),
          SvgPicture.asset(
            "assets/svg/surface2.svg",
            height: 24,
            width: 24,
          ),
          SizedBox(width: 22.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
