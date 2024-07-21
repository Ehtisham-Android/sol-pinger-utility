import 'package:flutter/material.dart';
import '../../../../core/AppGlobals.dart';

PreferredSizeWidget mainAppBar(String title){
  return AppBar(
    title: Text(style: const TextStyle(color: AppColors.white), title),
    centerTitle: true,
    backgroundColor: AppColors.primaryDark,
  );
}