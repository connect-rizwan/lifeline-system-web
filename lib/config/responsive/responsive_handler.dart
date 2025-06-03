import 'package:flutter/material.dart';

class ResponsiveHandler {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 765;

  static bool isMenuWidthReach(BuildContext context) =>
      MediaQuery.of(context).size.width < 890;

  static bool isFloatingMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 990;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double getWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (isDesktop(context)) {
      return width * 0.8;
    } else if (isTablet(context)) {
      return width * 0.9;
    } else {
      return width * 0.95;
    }
  }
}
