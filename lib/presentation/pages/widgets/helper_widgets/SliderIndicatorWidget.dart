import 'package:flutter/cupertino.dart';
import '../../../../core/AppGlobals.dart';

List<Widget> indicators(imagesLength, currentIndex,
    [selectedIndicatorColor = AppColors.turquoise,
    indicatorColor = AppColors.greenishGrey]) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 13,
      height: 3,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? AppColors.turquoise
              : AppColors.greenishGrey,
          shape: BoxShape.rectangle),
    );
  });
}
