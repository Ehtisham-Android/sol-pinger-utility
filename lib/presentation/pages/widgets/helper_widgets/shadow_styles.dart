import 'package:flutter/cupertino.dart';
import '../../../../core/AppGlobals.dart';

class ShadowStyle {
  static const verticalProductShadow = BoxShadow(
    color: AppColors.grey_100,
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2)
  );

  static const horizontalProductShadow = BoxShadow(
      color: AppColors.grey_100,
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2)
  );
}