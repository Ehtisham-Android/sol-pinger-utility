import 'package:flutter/material.dart';
import '../../../../core/AppGlobals.dart';
import '../../../../core/constants/constants.dart';

final ButtonStyle btnPalOrangeSmall = ElevatedButton.styleFrom(
    backgroundColor: AppColors.paleOrange, fixedSize: const Size(200,Dimens.btnHeightSmall));

final ButtonStyle btnPaleOrange = ElevatedButton.styleFrom(
    backgroundColor: AppColors.paleOrange);

final ButtonStyle btnPaleOrangeGeneric = ElevatedButton.styleFrom(
    backgroundColor: AppColors.paleOrange ,fixedSize: const Size(200, Dimens.btnHeightGeneric));

final ButtonStyle btnPaleOrangeLarge = ElevatedButton.styleFrom(
    backgroundColor: AppColors.paleOrange, fixedSize: const Size(200, Dimens.btnHeightLarge));

final ButtonStyle btnTurquoiseMedium = ElevatedButton.styleFrom(
    backgroundColor: AppColors.turquoise);

final ButtonStyle btnWhite = ElevatedButton.styleFrom(
    backgroundColor: AppColors.white);

final ButtonStyle btnTurquoiseFixed = ElevatedButton.styleFrom(
    backgroundColor: AppColors.turquoise, fixedSize: const Size(130, Dimens.btnHeightMedium));

final ButtonStyle btnPaleOrangeFixed = ElevatedButton.styleFrom(
    backgroundColor: AppColors.paleOrange, fixedSize: const Size(130, Dimens.btnHeightMedium));

final ButtonStyle btnOrangeFixedSize = ElevatedButton.styleFrom(
    backgroundColor: AppColors.orange, fixedSize: const Size(130,Dimens.btnHeightMedium));