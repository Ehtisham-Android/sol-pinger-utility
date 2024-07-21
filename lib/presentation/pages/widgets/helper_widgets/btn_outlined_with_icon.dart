import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

import '../../../../core/AppGlobals.dart';
import '../../../../core/constants/constants.dart';
import 'item_space.dart';

class BtnOutlinedWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color? dominantColor;

  const BtnOutlinedWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.dominantColor = AppColors.turquoise,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(
              Dimens.spaceMedium),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
                  Dimens.radiusLarge)),
          side: BorderSide(
              width: 1.0,
              color: dominantColor!),
        ),
        onPressed: onPressed,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          customText(text, dominantColor!, FontSize.fontSizeMedium),
          hSpaceSmall(),
          Icon(
            //Icons.trending_flat,
            icon,
            color: dominantColor,
            size: 20.0,
          )
        ]));
  }
}