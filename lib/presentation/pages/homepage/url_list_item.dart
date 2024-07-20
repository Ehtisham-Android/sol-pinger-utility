import 'dart:convert';

import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sol_pinger_utility/core/AppGlobals.dart';
import 'package:sol_pinger_utility/core/Utils.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/loading_indicator.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_bloc.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_event.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/button_styles.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/decision_dialog.dart';

import '../../../controllers/url_ping_status_controller.dart';
import '../../../core/constants/constants.dart';
import '../widgets/helper_widgets/rounded_container.dart';
import 'package:get/get.dart';

import '../widgets/helper_widgets/text_styles.dart';

Widget urlListItem(BuildContext context, UrlEntity urlEntity,
    DatabaseHelper database, int index) {
  final urlPingStatusController = Get.put(UrlPingStatusController());

  return GestureDetector(
    onTap: () {
      //goToCategoriesScreen(context, category.id, category.name);
    },
    child: SizedBox(
      width: getScreenWidth(context),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RoundedContainer(
              width: Dimens.iconMedium,
              radius: Dimens.radiusXXXLarge,
              padding: const EdgeInsets.all(Dimens.spaceSmall),
              backgroundColor: AppColors.primaryDark.withOpacity(0.8),
              child: textWhiteMedium(index.toString())),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.spaceMedium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textSecondaryDarkXLarge(urlEntity.url, bold: true),
                  textGreyMedium(
                      tAlign: TextAlign.start,
                      maxLines: 2,
                      "Last checked: ${urlEntity.lastChecked}"),
                  textGreySmall("Created at: ${urlEntity.createdAt}"),
                  Obx(() => urlPingStatusController.getIsLoading(urlEntity.id)
                      ? Row(children: [
                          textGreySmall("Pinging ..."),
                          hSpaceMedium(),
                          const LoadingIndicator(size: 30.0)
                        ])
                      : textGreySmall(urlPingStatusController
                          .getUrl(urlEntity.id)!
                          .status)),
                  Row(children: [
                    OutlinedButton(
                        style: btnPrimaryMidMedium,
                        onPressed: () async {
                          urlPingStatusController.pingUrl(urlEntity, database);
                        },
                        child: textPrimaryMidSmall("Ping")),
                    hSpaceMedium(),
                    ElevatedButton(
                        style: btnSecondaryDarkMedium,
                        onPressed: () async {
                          showDecisionDialog(context,
                              "Are you sure you want to delete\n \"${urlEntity.url}\"",
                              onPositivePressed: () {
                            context.read<HomePageBloc>().add(
                                DeleteUrlFromUrlList(id: urlEntity.id ?? -1));
                          });
                        },
                        child: textWhiteSmall("Remove"))
                  ]),
                ],
              ),
            ),
          ),
          // Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: Dimens.spaceSmall),
          //     child: textGreyExtraSmall(urlEntity.severity, bold: true)),
          Column(children: [
            RoundedContainer(
                width: Dimens.iconSmall,
                height: Dimens.iconSmall,
                radius: Dimens.radiusXXLarge,
                backgroundColor: getStatusColor(urlEntity))
          ]),
        ]),
        vSpaceSmall(),
        const Divider(color: AppColors.border_color)
      ]),
    ),
  );
}

Future<PingData> startPing(String url) async {
  final result =
      await Ping(url, count: 1, encoding: const Utf8Codec(allowMalformed: true))
          .stream
          .first;
  return result;
}

// Future<PingData?> startPing(String url) async {
//   // Create instance of DartPing
//   final ping = Ping(url, count: 1);
//   var pingData;
//   print('Running command: ${ping.command}');
//   ping.stream.listen((event) {
//     pingData = event;
//   });
//
//   return pingData;
// }

Color getStatusColor(UrlEntity urlEntity) {
  if (urlEntity.status == "success") {
    return AppColors.green;
  }

  return AppColors.red;
}

String getCurrentDateAndTime() {
  DateTime now = DateTime.now();
  String dateTime =
      "${DateFormat.yMMMEd().format(now)} ${DateFormat.Hms().format(now)}";

  return dateTime;
}
