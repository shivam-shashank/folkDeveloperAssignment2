import 'package:flutter/cupertino.dart';
import 'package:folk_developers_assignment2/constants.dart';

class HalfCircleModel with ChangeNotifier {
  Color color = Constants.yellow;
  double opacity = 1.0;

  changeHalfCircleColor(Color tempColor) {
    color = tempColor;
    notifyListeners();
  }

  changeHalfCircleOpacity(double tempOpacity) {
    opacity = tempOpacity;
    notifyListeners();
  }
}
