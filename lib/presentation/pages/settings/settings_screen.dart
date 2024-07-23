import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/core/constants/app_shared_prefs.dart';
import 'package:sol_pinger_utility/locator.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/app_bar.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/buttons.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/constants.dart';
import '../widgets/helper_widgets/counter.dart';

String selectedUrlType = "";

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({required this.goBack, super.key});

  final void Function(int) goBack;

  void saveSettings(BuildContext context, AppSharedPref prefs, int interval) {
    prefs.scheduleInterval = interval;
    showPostFrameSnackBar(context, "Settings saved");
    goBack(0);
  }

  @override
  Widget build(BuildContext context) {
    var prefs = locator<AppSharedPref>();
    int interval = prefs.scheduleInterval;

    return Scaffold(
      appBar: mainAppBar(AppLocalizations.of(context)?.appName ?? "Sol Pinger"),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.screenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    textSecondaryDarkMedium("Schedule Interval"),
                    hSpaceMedium(),
                    Expanded(
                      child: CounterWidget(
                        initNumber: interval,
                        counterCallback: (counter) {
                          interval = counter;
                        },
                        increaseCallback: () {},
                        decreaseCallback: () {},
                        minNumber: 1, maxNumber: 60,
                      ),
                    ),
                  ],

                ),
                vSpaceLarge(),
                Center(
                  child: SecondaryDarkButton(
                    text: 'Save Settings',
                    onPressed: () => saveSettings(context, prefs, interval),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
