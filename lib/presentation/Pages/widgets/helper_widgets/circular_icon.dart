import 'package:flutter/material.dart';

import '../../../../core/AppGlobals.dart';
import '../../../../core/Utils.dart';
import '../../../../core/constants/constants.dart';


class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {super.key,
      required this.icon,
      this.width,
      this.height,
      this.size = Dimens.iconSmall,
      this.onPressed,
      this.color,
      this.backgroundColor});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : isDark
                ? AppColors.circular_icon_bg_dark.withOpacity(0.9)
                : AppColors.circular_icon_bg_light.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100)
      ),
      child: IconButton(onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
