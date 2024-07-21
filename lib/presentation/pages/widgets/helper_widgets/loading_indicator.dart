import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.size, super.key});

  final double? size;

  @override
  Widget build(BuildContext context) {
    if (size != null) {
      return Center(
        child: Container(
            height: size,
            width: size,
            padding: const EdgeInsets.all(Dimens.spaceMedium),
            child: const CircularProgressIndicator()),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }

    // return Center(
    //   child: size != null ? SizedBox(height: size, width: size, child: const CircularProgressIndicator()) : const CircularProgressIndicator()
    // );
  }
}
