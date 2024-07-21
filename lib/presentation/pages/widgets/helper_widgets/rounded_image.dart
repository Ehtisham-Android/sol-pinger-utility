import 'package:flutter/cupertino.dart';

import '../../../../core/AppGlobals.dart';
import '../../../../core/constants/constants.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.image,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.isNetworkImage = false,
    this.borderRadius = Dimens.radiusLarge});

  final double? width, height;
  final String image;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    var placeHolder = AppImages.imgPlaceholder(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              border: border,
              color: backgroundColor ?? AppColors.bgColor(context),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: _customNetworkImage(image, placeHolder)
          )),
    );
  }
}

Widget _customNetworkImage(String url, String placeholder) {
  return FadeInImage(
    image: NetworkImage(url),
    placeholder: AssetImage(placeholder),
    imageErrorBuilder: (context, error, stackTrace) {
      return Image.asset(placeholder,
          fit: BoxFit.fitWidth
      );
    },
    fit: BoxFit.fitWidth,
  );
}
