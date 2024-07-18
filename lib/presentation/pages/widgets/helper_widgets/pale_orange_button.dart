import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import 'button_styles.dart';
import 'text_styles.dart';

class PaleOrangeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final double? width = 130.0;
  final ButtonSizes? size;

  //const PaleOrangeButton(this.text, this.onPressed, this.child, {width, super.key});

  const PaleOrangeButton({super.key, this.text, this.onPressed, this.size, width});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width ?? 130.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: btnPaleOrange,
        child: switch(size ?? ButtonSizes.MEDIUM){
          ButtonSizes.SMALL => textWhiteSmall(text ?? ''),
          ButtonSizes.MEDIUM => textWhiteMedium(text ?? ''),
          ButtonSizes.LARGE => textWhiteLarge(text ?? ''),
        },
      ),
    );
  }
}
