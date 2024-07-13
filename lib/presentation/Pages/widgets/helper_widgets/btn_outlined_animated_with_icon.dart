import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

import '../../../../core/AppGlobals.dart';
import '../../../../core/constants/constants.dart';
import 'item_space.dart';

class BtnOutlinedAnimatedWithIcon extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color? dominantColor;

  const BtnOutlinedAnimatedWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.dominantColor = AppColors.turquoise,
    required this.onPressed,
  });

  @override
  _BtnOutlinedAnimatedWithIconState createState() =>
      _BtnOutlinedAnimatedWithIconState();
}

class _BtnOutlinedAnimatedWithIconState
    extends State<BtnOutlinedAnimatedWithIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(Dimens.spaceMedium),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.radiusLarge)),
            side: BorderSide(width: 1.0, color: widget.dominantColor!),
          ),
          onPressed: widget.onPressed,
          child: Row(children: [
            Expanded(
              child: customText(
                  widget.text, widget.dominantColor!, FontSize.fontSizeMedium),
            ),
            hSpaceSmall(),
            Icon(
              widget.icon,
              color: widget.dominantColor,
              size: 20.0,
            )
          ])),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}