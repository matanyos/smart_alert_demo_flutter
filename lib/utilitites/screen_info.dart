import 'package:flutter/cupertino.dart';

class ScreenInfo {
  final BuildContext context;
  late Size screenSize;

  ScreenInfo(this.context) {
    screenSize = MediaQuery.of(context).size;
  }

  Size getScreenSize() => screenSize;

  bool isSmallScreen() => screenSize.width < 800;
}
