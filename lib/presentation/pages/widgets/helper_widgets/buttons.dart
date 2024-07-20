import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

import '../../../../core/constants/constants.dart';
import 'button_styles.dart';

class SecondaryDarkButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final double? width = 130.0;
  final ButtonSizes? size;

  const SecondaryDarkButton({super.key, this.text, this.onPressed, this.size, width});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width ?? 130.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: btnSecondaryDarkMedium,
        child: switch(size ?? ButtonSizes.MEDIUM){
          ButtonSizes.SMALL => textWhiteSmall(text ?? ''),
          ButtonSizes.MEDIUM => textWhiteMedium(text ?? ''),
          ButtonSizes.LARGE => textWhiteLarge(text ?? ''),
        },
      ),
    );
  }
}

class SecondaryMidButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final double? width = 130.0;
  final ButtonSizes? size;

  const SecondaryMidButton({super.key, this.text, this.onPressed, this.size, width});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width ?? 130.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: btnSecondaryMidMedium,
        child: switch(size ?? ButtonSizes.MEDIUM){
          ButtonSizes.SMALL => textWhiteSmall(text ?? ''),
          ButtonSizes.MEDIUM => textWhiteMedium(text ?? ''),
          ButtonSizes.LARGE => textWhiteLarge(text ?? ''),
        },
      ),
    );
  }
}

class SecondaryLightButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final double? width = 130.0;
  final ButtonSizes? size;

  const SecondaryLightButton({super.key, this.text, this.onPressed, this.size, width});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width ?? 130.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: btnSecondaryLightMedium,
        child: switch(size ?? ButtonSizes.MEDIUM){
          ButtonSizes.SMALL => textWhiteSmall(text ?? ''),
          ButtonSizes.MEDIUM => textWhiteMedium(text ?? ''),
          ButtonSizes.LARGE => textWhiteLarge(text ?? ''),
        },
      ),
    );
  }
}