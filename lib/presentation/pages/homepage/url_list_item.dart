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
      child: Obx(() => Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              RoundedContainer(
                  width: Dimens.iconMedium,
                  height: Dimens.iconMedium,
                  radius: Dimens.radiusXXXLarge,
                  padding: const EdgeInsets.all(Dimens.spaceSmall),
                  backgroundColor: AppColors.primaryDark.withOpacity(0.8),
                  child: textWhiteSmall(index.toString())),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spaceMedium),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSecondaryDarkXLarge(urlEntity.url, bold: true),
                      textGreySmall("Created at: ${urlEntity.createdAt}"),
                      urlPingStatusController.getIsLoading(urlEntity.id)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textGreyMedium("Last checked: ..."),
                                Row(children: [
                                  textGreySmall("Pinging ..."),
                                  hSpaceMedium(),
                                  const LoadingIndicator(size: 30.0)
                                ]),
                                textGreySmall(
                                    "Total hits: ${urlPingStatusController.getUrl(urlEntity.id)!.hitsSince}")
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textGreyMedium(
                                    tAlign: TextAlign.start,
                                    maxLines: 2,
                                    "Last checked: ${urlPingStatusController.getUrl(urlEntity.id)!.lastChecked}"),
                                textGreySmall(urlPingStatusController
                                    .getUrl(urlEntity.id)!
                                    .status, bold: true),
                                textGreySmall(
                                    "Total hits: ${urlPingStatusController.getUrl(urlEntity.id)!.hitsSince}")
                              ],
                            ),
                      Row(children: [
                        OutlinedButton(
                            style: btnPrimaryMidMedium,
                            onPressed: urlPingStatusController.getIsLoading(urlEntity.id) ? null : () async {
                              urlPingStatusController.hitUrl(
                                  urlPingStatusController.getUrl(urlEntity.id)!, database);
                            },
                            child: textPrimaryMidSmall("Ping")),
                        hSpaceSmall(),
                        ElevatedButton(
                            style: btnSecondaryDarkMedium,
                            //icon: const Icon(Icons.delete_outline, color: AppColors.white),
                            iconAlignment: IconAlignment.end,
                            onPressed: urlPingStatusController.getIsLoading(urlEntity.id) ? null : () async {
                              showDecisionDialog(context,
                                  "Are you sure you want to delete\n \"${urlEntity.url}\"",
                                  onPositivePressed: () {
                                context.read<HomePageBloc>().add(
                                    DeleteUrlFromUrlList(
                                        id: urlEntity.id ?? -1));
                              });
                            },
                            //label: textWhiteSmall("Delete")),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                textWhiteSmall("Delete"),
                                hSpaceSmall(),
                                const Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            )),
                            //child: textWhiteSmall("Delete"))
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
                    backgroundColor: urlPingStatusController.getIsLoading(urlEntity.id) ? getStatusColor(STATUSES.PINGING.name) :
                    getStatusColor(urlPingStatusController.getUrl(urlEntity.id)!.status))
              ]),
            ]),
            vSpaceSmall(),
            const Divider(color: AppColors.border_color)
          ])),
    ),
  );
}

Color getStatusColor(String status) {
  if (status == STATUSES.SUCCESS.name) {
    return AppColors.green;
  } else if (status == STATUSES.PINGING.name){
    return AppColors.grey_500;
  }

  return AppColors.red;
}

String getCurrentDateAndTime() {
  DateTime now = DateTime.now();
  String dateTime =
      "${DateFormat.yMMMEd().format(now)} ${DateFormat.Hms().format(now)}";

  return dateTime;
}
