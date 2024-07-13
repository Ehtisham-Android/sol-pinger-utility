import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/presentation/Pages/urls_list.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/turquoise_button.dart';

import '../../core/AppGlobals.dart';
import '../../core/constants/constants.dart';
import '../../locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  PingData? _lastPing;
  final TextEditingController _controller =
  TextEditingController(text: 'google.com');

  void _startPing() {
    // Create instance of DartPing
    final ping = Ping(_controller.text, count: 3);
    print('Running command: ${ping.command}');
    ping.stream.listen((event) {
      setState(() {
        _lastPing = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textOrangeXLarge('Sol Pinger Utility', bold: true),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.spaceLarge),
                color: AppColors.beigeColor(context),
                height:
                CategoriesItemHeight.subCategoryHeight,
                child: UrlsList()),
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
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(Dimens.radiusXXXLarge)),
                    hintText: 'Please type url to ping ...',
                    hintStyle: const TextStyle(color: AppColors.hintTextColor)),
              ),
            ),
            textGreyLarge(
              maxLines: 3,
              _lastPing?.toString() ?? '',
            ),
            vSpaceLarge(),
            Center(
              child: TurquoiseButton(text: 'Ping', onPressed: _startPing),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _startPing,
      //   tooltip: 'Start Ping',
      //   child: const Icon(Icons.radar_sharp),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}