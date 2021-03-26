import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk_developers_assignment2/constants.dart';

class AllRoomsContainer extends StatelessWidget {
  final String svgPath;
  final String roomType;
  final int numberOfLights;

  const AllRoomsContainer({
    Key key,
    @required this.svgPath,
    @required this.roomType,
    @required this.numberOfLights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white,
        boxShadow: [Constants.boxShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0.0, 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(svgPath),
            Text(
              roomType,
              style: TextStyle(
                color: Constants.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              numberOfLights == 1
                  ? "$numberOfLights Light"
                  : "$numberOfLights Lights",
              style: TextStyle(
                color: Constants.yellow,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
