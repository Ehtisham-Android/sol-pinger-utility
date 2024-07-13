import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/locator.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/turquoise_button.dart';

import '../../core/AppGlobals.dart';
import '../../core/constants/constants.dart';

class AddUrlScreen extends StatefulWidget {
  const AddUrlScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<AddUrlScreen> {
  final TextEditingController _controller = TextEditingController(text: '');

  void _saveUrl(String url) async {
    // insert db record
    final dbHelper = locator<DatabaseHelper>();
    final urlEntity =
        UrlEntity(id: 0, url: url, noOfTries: 3, isPeriodic: "1");
    dbHelper.insertUrl(urlEntity);

    final urls = await dbHelper.getUrlsMapList();
    List<UrlEntity> urlsList = [];
    for (int index = 0; index < urls.length; index++) {
      urlsList.add(UrlEntity.fromJson(urls[index]));
    }

    if (kDebugMode) {
      print("Ehtisham: ${urlsList.toString()}");
    }

    // Create instance of DartPing
    // final ping = Ping(_controller.text, count: 3);
    // print('Running command: ${ping.command}');
    // ping.stream.listen((event) {
    //   setState(() {
    //     _lastPing = event;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
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
              child: TurquoiseButton(text: 'Save URL', onPressed: () async {
                final dbHelper = locator<DatabaseHelper>();
                final urlEntity = UrlEntity(url: _controller.text, noOfTries: 3, isPeriodic: "1");
                await dbHelper.insertUrl(urlEntity);

                final urls = await dbHelper.getUrlsMapList();
                List<UrlEntity> urlsList = [];
                for (int index = 0; index < urls.length; index++) {
                  urlsList.add(UrlEntity.fromJson(urls[index]));
                }

                if (kDebugMode) {
                  print("Ehtisham: ${urlsList.toString()}");
                }

              }),
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
