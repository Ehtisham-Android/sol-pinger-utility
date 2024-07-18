import 'package:flutter/cupertino.dart';

import '../../../../core/AppGlobals.dart';
import '../../../../core/constants/constants.dart';

// RICH TEXT ///////////////////////////////////////////////////////////////////
Widget spannedText(
    BuildContext context, String t1, String t2, Color t1Color, Color t2Color) {
  return RichText(
    text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: [
        TextSpan(
          text: t1,
          style: TextStyle(color: t1Color),
        ),
        TextSpan(
          text: ' $t2',
          style: TextStyle(color: t2Color, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

// WHITE TEXT //////////////////////////////////////////////////////////////////
Widget textWhiteExtraSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.white,
        fontSize: FontSize.fontSizeExtraSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textWhiteSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.white,
        fontSize: FontSize.fontSizeSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textWhiteMedium(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.white,
        fontSize: FontSize.fontSizeMedium,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textWhiteLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.white,
        fontSize: FontSize.fontSizeLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textWhiteXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.white,
        fontSize: FontSize.fontSizeXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textWhiteXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.white,
        fontSize: FontSize.fontSizeXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textWhiteXXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.white,
        fontSize: FontSize.fontSizeXXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

// DARK GRAY TEXT //////////////////////////////////////////////////////////////
Widget textGreyExtraSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center, isStrikeThrough = false}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        decoration: isStrikeThrough ? TextDecoration.lineThrough : TextDecoration.none,
        color: AppColors.grey_700,
        fontSize: FontSize.fontSizeExtraSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textGreySmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center, isStrikeThrough = false}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        decoration: isStrikeThrough ? TextDecoration.lineThrough : TextDecoration.none,
        color: AppColors.grey_700,
        fontSize: FontSize.fontSizeSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textGreyMedium(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center, isStrikeThrough = false}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        decoration: isStrikeThrough ? TextDecoration.lineThrough : TextDecoration.none,
        color: AppColors.grey_700,
        fontSize: FontSize.fontSizeMedium,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textGreyLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_700,
        fontSize: FontSize.fontSizeLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textGreyXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_700,
        fontSize: FontSize.fontSizeXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textGreyXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_700,
        fontSize: FontSize.fontSizeXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textGreyXXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_700,
        fontSize: FontSize.fontSizeXXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

// LIGHT GRAY TEXT /////////////////////////////////////////////////////////////
Widget textLightGreyExtraSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_500,
        fontSize: FontSize.fontSizeExtraSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textLightGreySmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_500,
        fontSize: FontSize.fontSizeSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textLightGreyMedium(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_500,
        fontSize: FontSize.fontSizeMedium,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textLightGreyLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_500,
        fontSize: FontSize.fontSizeLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textLightGreyXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_500,
        fontSize: FontSize.fontSizeXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textLightGreyXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_500,
        fontSize: FontSize.fontSizeXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textLightGreyXXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.grey_500,
        fontSize: FontSize.fontSizeXXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

// BLACK TEXT //////////////////////////////////////////////////////////////////
Widget textBlackExtraSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.fontSizeExtraSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textBlackSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.fontSizeSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textBlackMedium(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center, isItalic = false}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.fontSizeMedium,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textBlackLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.fontSizeLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textBlackXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.fontSizeXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textBlackXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.fontSizeXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textBlackXXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.fontSizeXXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

// Orange TEXT //////////////////////////////////////////////////////////////////
Widget textOrangeExtraSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.orange,
        fontSize: FontSize.fontSizeExtraSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textOrangeSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.orange,
        fontSize: FontSize.fontSizeSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textOrangeMedium(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.orange,
        fontSize: FontSize.fontSizeMedium,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textOrangeLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.orange,
        fontSize: FontSize.fontSizeLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textOrangeXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.orange,
        fontSize: FontSize.fontSizeXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textOrangeXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.orange,
        fontSize: FontSize.fontSizeXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textOrangeXXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.orange,
        fontSize: FontSize.fontSizeXXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

// Turquoise TEXT //////////////////////////////////////////////////////////////////
Widget texTurquoiseExtraSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.turquoise,
        fontSize: FontSize.fontSizeExtraSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textTurquoiseSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.turquoise,
        fontSize: FontSize.fontSizeSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textTurquoiseMedium(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.turquoise,
        fontSize: FontSize.fontSizeMedium,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textTurquoiseLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.turquoise,
        fontSize: FontSize.fontSizeLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textTurquoiseXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.turquoise,
        fontSize: FontSize.fontSizeXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textTurquoiseXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.turquoise,
        fontSize: FontSize.fontSizeXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

Widget textTurquoiseXXXLarge(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.turquoise,
        fontSize: FontSize.fontSizeXXXLarge,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

// Red TEXT ////////////////////////////////////////////////////////////////////
Widget textRedSmall(String text,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: AppColors.red,
        fontSize: FontSize.fontSizeSmall,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}

// General Text ////////////////////////////////////////////////////////////////
Widget customText(String text, Color color, double size,
    {bold = false, maxLines = 1, tAlign = TextAlign.center}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: tAlign,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
  );
}
