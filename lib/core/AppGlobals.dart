import 'package:flutter/material.dart';

import 'Utils.dart';

class AppColors {
  static const turquoise = Color(0xff45bda0);
  static const turquoiseVariant = Color(0xff456fbd);
  static const paleOrange = Color(0xffDDBB41);
  static const paleOrangeVariant = Color(0xffffc803);
  static const orange = Color(0xffF28721);
  static const red = Color(0xffE51A1A);
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const greenishGrey = Color(0xff99c9cb);
  static const navy = Color(0xffd0e9e6);
  static const navyDark = Color(0xff37504d);
  static const sky = Color(0xffB3E5FC);
  static const yellow = Color(0xffFFD460);
  static const beige = Color(0xffF6F1DF);
  static const beigeDark = Color(0xff898472);
  static const hintTextColor = Color(0xff9E9E9E);
  static const materialSurface = Color(0xfff9f9f9);
  static const materialSurfaceDark = Color(0xff616161);

  static const veryLightGrey = Color(0xffececec);
  static const grey_800 = Color(0xff424242);
  static const grey_700 = Color(0xff616161);
  static const grey_600 = Color(0xff757575);
  static const grey_500 = Color(0xff9E9E9E);
  static const grey_400 = Color(0xffBDBDBD);
  static const grey_300 = Color(0xffE0E0E0);
  static const grey_200 = Color(0xffEEEEEE);
  static const grey_100 = Color(0xffF5F5F5);
  static const grey_50 = Color(0xffF4F4F4);

  static const border_color = Color(0xffE0E0E0);
  static const background_light_color = Color(0xffFFFFFF);
  static const background_dark_color = Color(0xff424242);

  static const circular_icon_bg_light = Color(0xffEEEEEE);
  static const circular_icon_bg_dark = Color(0xff616161);

  static Color topBarColor(BuildContext context){
    return isDarkMode(context) ? materialSurfaceDark : turquoise;
  }

  static Color homeColor(BuildContext context){
    return isDarkMode(context) ? materialSurfaceDark : turquoise;
  }

  static Color homeMainColor(BuildContext context){
    return isDarkMode(context) ? black : materialSurface;
  }

  static Color categoriesBgColor(BuildContext context){
    return isDarkMode(context) ? materialSurfaceDark : materialSurface;
  }

  static Color skyColor(BuildContext context){
    return isDarkMode(context) ? materialSurfaceDark : sky;
  }

  static Color beigeColor(BuildContext context){
    return isDarkMode(context) ? beigeDark : beige;
  }

  static Color navyColor(BuildContext context){
    return isDarkMode(context) ? navyDark : navy;
  }

  static Color qtyBgColor(BuildContext context){
    return isDarkMode(context) ? materialSurfaceDark : materialSurface;
  }

  static Color whiteColor(BuildContext context){
    return isDarkMode(context) ? grey_800 : white;
  }

  static Color bgColor(BuildContext context){
    return isDarkMode(context) ? background_dark_color : background_light_color;
  }

  static Color materialSurfaceColor(BuildContext context){
    return isDarkMode(context) ? materialSurfaceDark : materialSurface;
  }

  static Color shadowColor(BuildContext context){
    return isDarkMode(context) ? grey_400 : grey_100;
  }

}

Widget sizeHeight(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sizeWidth(double width) {
  return SizedBox(
    width: width,
  );
}
