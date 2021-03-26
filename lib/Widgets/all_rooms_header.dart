import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllRoomsHeader extends StatelessWidget {
  const AllRoomsHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 20.0, 24.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Control\nPanel",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SvgPicture.asset("assets/svg/user.svg")
          ],
        ),
      ),
    );
  }
}
