import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/locator.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/turquoise_button.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/snack_bar.dart';

import '../../core/AppGlobals.dart';
import '../../core/constants/constants.dart';

class AddUrlScreen extends StatelessWidget {

  const AddUrlScreen({required this.goBack, super.key});

  final void Function(int) goBack;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: textBlackXLarge('Sol Pinger Utility', bold: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.url,
                maxLength: 200,
                //onChanged: onChanged,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimens.textFieldContentPadding),
                    constraints: BoxConstraints.tight(
                        const Size.fromHeight(Dimens.textFieldHeight)),
                    filled: true,
                    fillColor: AppColors.navy,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                        BorderRadius.circular(Dimens.radiusXXXLarge)),
                    hintText: 'Type url here ...',
                    hintStyle: const TextStyle(color: AppColors.grey_600)),
              ),
            ),
            vSpaceLarge(),
            Center(
              child: TurquoiseButton(
                  text: 'Save URL',
                  onPressed: () async {
                    final dbHelper = locator<DatabaseHelper>();
                    DateTime now = DateTime.now();
                    String date = DateFormat.yMMMEd().format(now);
                    final urlEntity =
                    UrlEntity(
                        url: _controller.text,
                        noOfTries: 3,
                        isPeriodic: "1",
                        severity: 'critical',
                        lastChecked: '',
                        status: 'Just added',
                        createdAt: date,
                        totalFailures: 0,
                        hitsSince: 0
                    );
                    await dbHelper.insertUrl(urlEntity);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showSnackBar(context, "${_controller.text} added successfully!");
                    });
                    _controller.text = "";
                    goBack(0);

                  }),
            ),
          ],
        ),
      ),
    );
  }
}