import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folk_developers_assignment2/Models/HalfCircleColorModel.dart';
import 'package:provider/provider.dart';

import 'Screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: HalfCircleModel())],
      child: MaterialApp(
        title: "Folk Developers Assignment2",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
