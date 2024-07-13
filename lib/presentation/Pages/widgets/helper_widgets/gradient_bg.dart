import 'package:flutter/cupertino.dart';
import '../../../../core/AppGlobals.dart';

BoxDecoration gradientBg() {
  return const BoxDecoration(
    gradient: LinearGradient(
        colors: [AppColors.paleOrange, AppColors.turquoise],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
  );
}
