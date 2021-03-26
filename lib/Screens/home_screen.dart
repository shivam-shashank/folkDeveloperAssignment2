import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk_developers_assignment2/Models/HalfCircleColorModel.dart';
import 'package:folk_developers_assignment2/Widgets/all_rooms_container.dart';
import 'package:folk_developers_assignment2/Widgets/all_rooms_header.dart';
import 'package:folk_developers_assignment2/Widgets/circle_color.dart';
import 'package:folk_developers_assignment2/Widgets/room_details_header.dart';
import 'package:folk_developers_assignment2/Widgets/scenes_container.dart';
import 'package:folk_developers_assignment2/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double heightOfAllRoomsContainer;
  bool showRoom = false;
  double value = 6.0;

  _changeShowRoomValue() {
    setState(() {
      showRoom = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenDim = MediaQuery.of(context).size;
    heightOfAllRoomsContainer =
        showRoom ? screenDim.height * .59 : screenDim.height * .7;

    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -1.65),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: SvgPicture.asset(
                "assets/svg/Circles.svg",
                width: screenDim.width * 1.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: showRoom
                        ? RoomDetailsHeader(
                            screenDim: screenDim,
                            changeShowRoomValue: () => _changeShowRoomValue(),
                          )
                        : AllRoomsHeader(),
                  ),
                  AnimatedContainer(
                    width: double.infinity,
                    height: heightOfAllRoomsContainer,
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: showRoom
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16),
                                Constants().textWidget("Intensity"),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svg/solution2.svg"),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              trackHeight: 2.0,
                                              activeTrackColor:
                                                  Colors.yellow[600],
                                              inactiveTrackColor:
                                                  Colors.grey[300],
                                              overlayColor: Colors.yellow[200],
                                              thumbColor: Colors.white,
                                            ),
                                            child: Slider(
                                              value: value,
                                              min: 0.0,
                                              max: 6.0,
                                              onChanged: (double newValue) {
                                                setState(() {
                                                  value = newValue;
                                                });
                                                Provider.of<HalfCircleModel>(
                                                  context,
                                                  listen: false,
                                                ).changeHalfCircleOpacity(
                                                    newValue / 6);
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                6,
                                                (index) => Text(
                                                  "|",
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SvgPicture.asset("assets/svg/solution.svg"),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Constants().textWidget("Colors"),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    CircleColor(
                                      color: Constants.darkOrange,
                                    ),
                                    CircleColor(
                                      color: Constants.darkGreen,
                                    ),
                                    CircleColor(
                                      color: Constants.darkBlue,
                                    ),
                                    CircleColor(
                                      color: Constants.darkPurple,
                                    ),
                                    CircleColor(
                                      color: Constants.lightPurple,
                                    ),
                                    CircleColor(
                                      color: Constants.yellow,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 14.0),
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 26.0,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 16),
                                Constants().textWidget("Scenes"),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ScenesContainer(
                                      text: "Birthday",
                                      gradientColors: [
                                        Constants.darkOrange,
                                        Constants.lightOrange,
                                      ],
                                    ),
                                    ScenesContainer(
                                      text: "Party",
                                      gradientColors: [
                                        Constants.darkPurple,
                                        Constants.lightPurple,
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ScenesContainer(
                                      text: "Relax",
                                      gradientColors: [
                                        Constants.darkBlue,
                                        Constants.lightBlue,
                                      ],
                                    ),
                                    ScenesContainer(
                                      text: "Fun",
                                      gradientColors: [
                                        Constants.darkGreen,
                                        Constants.lightGreen,
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    32.0, 24.0, 0.0, 12.0),
                                child: Constants().textWidget("All Rooms"),
                              ),
                              Expanded(
                                child: GridView.count(
                                  physics: BouncingScrollPhysics(),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 24,
                                  crossAxisSpacing: 28,
                                  padding: EdgeInsets.all(16),
                                  children: [
                                    GestureDetector(
                                      child: AllRoomsContainer(
                                        svgPath: "assets/svg/bed.svg",
                                        roomType: "Bed room",
                                        numberOfLights: 4,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          showRoom = true;
                                        });
                                      },
                                    ),
                                    AllRoomsContainer(
                                      svgPath: "assets/svg/room.svg",
                                      roomType: "Living room",
                                      numberOfLights: 2,
                                    ),
                                    AllRoomsContainer(
                                      svgPath: "assets/svg/kitchen.svg",
                                      roomType: "Kitchen",
                                      numberOfLights: 5,
                                    ),
                                    AllRoomsContainer(
                                      svgPath: "assets/svg/bathtube.svg",
                                      roomType: "Bathroom",
                                      numberOfLights: 1,
                                    ),
                                    AllRoomsContainer(
                                      svgPath: "assets/svg/house.svg",
                                      roomType: "Outdoor",
                                      numberOfLights: 5,
                                    ),
                                    AllRoomsContainer(
                                      svgPath: "assets/svg/balcony.svg",
                                      roomType: "Balcony",
                                      numberOfLights: 2,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                  )
                ],
              ),
              showRoom
                  ? Align(
                      alignment: Alignment(0.85, -.3),
                      child: Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/svg/Icon awesome-power-off.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new SvgPicture.asset("assets/svg/bulb.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: new SvgPicture.asset("assets/svg/Icon feather-home.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: new SvgPicture.asset("assets/svg/Icon feather-settings.svg"),
            label: "",
          ),
        ],
      ),
    );
  }
}
