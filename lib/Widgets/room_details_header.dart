import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk_developers_assignment2/Models/HalfCircleColorModel.dart';
import 'package:folk_developers_assignment2/constants.dart';
import 'package:provider/provider.dart';

import 'half_circle.dart';

class RoomDetailsHeader extends StatefulWidget {
  const RoomDetailsHeader({
    Key key,
    @required this.screenDim,
    @required this.changeShowRoomValue,
  }) : super(key: key);

  final Size screenDim;
  final Function changeShowRoomValue;

  @override
  _RoomDetailsHeaderState createState() => _RoomDetailsHeaderState();
}

class _RoomDetailsHeaderState extends State<RoomDetailsHeader>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool start = false;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..addListener(() => setState(() {}));
    animation = Tween(begin: 400.0, end: 0.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        start = true;
      });
    });

    return start
        ? Container(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenDim.height * .04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () => widget.changeShowRoomValue(),
                              ),
                              Text(
                                "Bed",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Room",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "4 Lights",
                              style: TextStyle(
                                color: Constants.yellow,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Transform.translate(
                      offset: Offset(
                        0.0,
                        -animation.value,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Stack(
                          children: [
                            Consumer<HalfCircleModel>(
                              builder: (context, abc, _) {
                                return HalfCircle(
                                  color: abc.color.withOpacity(abc.opacity),
                                );
                              },
                            ),
                            SvgPicture.asset(
                              "assets/svg/Group 38.svg",
                              width: widget.screenDim.width * .4,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32),
                Transform.translate(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svg/surface1.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Main Light",
                                    style: TextStyle(
                                      color: Constants.primaryColorDark,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Constants.primaryColorDark,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/svg/furniture-and-household.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Desk lights",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svg/bed (1).svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Bed Light",
                                    style: TextStyle(
                                      color: Constants.primaryColorDark,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  offset: Offset(
                    animation.value,
                    0.0,
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
