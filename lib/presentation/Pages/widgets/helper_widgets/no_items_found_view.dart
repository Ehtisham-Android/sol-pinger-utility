import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

import '../../../../core/constants/constants.dart';

class NoItemsFoundView extends StatelessWidget {
  const NoItemsFoundView({this.message, super.key});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: Dimens.spaceXXLarge),
      alignment: Alignment.center,
      child: textGreyLarge(message != null ? message! : AppLocalizations.of(context)!.no_data_found, maxLines: 5)
    );
  }
}
