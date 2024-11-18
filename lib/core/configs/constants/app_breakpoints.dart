class AppBreakpoints {
  static const desktop = 1060;
  static const tablet = 834;
  static const mobile = 375;

  static const twoColLayoutMinWidth = 800;
  static const threeColLayoutMinWidth = 2000;
}

double horizontalPadding(double screenWidth) {
  if (screenWidth > AppBreakpoints.desktop) {
    return 0;
  } else if (screenWidth > AppBreakpoints.mobile) {
    return 28;
  } else {
    return 20;
  }
}

double sliverHorizontalPadding(double screenWidth) {
  if (screenWidth > AppBreakpoints.desktop) {
    return (screenWidth - AppBreakpoints.desktop) / 2;
  } else if (screenWidth > AppBreakpoints.mobile) {
    return 28;
  } else {
    return 20;
  }
}

int calculateCrossAxisCount(double screenWidth) {
  if (screenWidth >= AppBreakpoints.threeColLayoutMinWidth) {
    return 3;
  } else if (screenWidth >= AppBreakpoints.twoColLayoutMinWidth) {
    return 2;
  } else {
    return 1;
  }
}
