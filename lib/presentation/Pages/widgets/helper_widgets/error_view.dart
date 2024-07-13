import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

class ErrorStateView extends StatelessWidget {
  const ErrorStateView(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: textGreyLarge(message, maxLines: 5)
    );
  }
}
