import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sol_pinger_utility/core/Utils.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/locator.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/app_bar.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/buttons.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/text_styles.dart';

import '../../../core/AppGlobals.dart';
import '../../../core/constants/constants.dart';
import '../widgets/helper_widgets/toggle_button.dart';

class AddUrlScreen extends StatelessWidget {
  const AddUrlScreen({required this.goBack, super.key});

  final void Function(int) goBack;

  void addUrl(BuildContext context, TextEditingController controller,
      String urlType) async {
    if (controller.text.isEmpty) {
      showPostFrameSnackBar(context, "Please enter a valid URL");
    } else {
      final dbHelper = locator<DatabaseHelper>();
      DateTime now = DateTime.now();
      String date = DateFormat.yMMMEd().format(now);
      final urlEntity = UrlEntity(
          url: formatUrl(urlType + controller.text),
          noOfTries: 3,
          isHalt: 0,
          severity: 'critical',
          lastChecked: '',
          status: 'Just added',
          createdAt: date,
          totalFailures: 0,
          hitsSince: 0);
      await dbHelper.insertUrl(urlEntity);
      showPostFrameSnackBar(context, "${controller.text} added successfully!");
      controller.text = "";
      goBack(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: '');
    final urlType = ["https://", "http://"];
    final urlTypeWidgetList = [
      textPrimaryDarkMedium("https"),
      textPrimaryDarkMedium("http")
    ];
    String selectedUrlType = "https://";

    return Scaffold(
      appBar: mainAppBar(AppLocalizations.of(context)?.appName ?? "Sol Pinger"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButtonsSample(
              list: urlTypeWidgetList,
              values: urlType,
              onToggleChanged: (selectedValue) {
                selectedUrlType = selectedValue;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.url,
                maxLength: 200,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.primaryDark),
                //onChanged: onChanged,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimens.textFieldContentPadding),
                    constraints: BoxConstraints.tight(
                        const Size.fromHeight(Dimens.textFieldHeight)),
                    filled: true,
                    fillColor: AppColors.grey_200,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(Dimens.radiusXXXLarge)),
                    hintText: 'Type url here ...',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryLight)),
              ),
            ),
            vSpaceLarge(),
            Center(
              child: SecondaryDarkButton(
                text: 'Save URL',
                onPressed: () => addUrl(context, controller, selectedUrlType),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
