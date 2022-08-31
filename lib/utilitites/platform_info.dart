import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformInfo {
  final BuildContext context;
  late Size screenSize;

  PlatformInfo(this.context) {
    screenSize = MediaQuery.of(context).size;
  }

  Size getScreenSize() => screenSize;

  bool isSmallScreen() => screenSize.width < 800;

  bool isMobile() =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;
}
