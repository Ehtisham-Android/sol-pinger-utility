import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/url_list_item.dart';

import '../../../controllers/url_ping_status_controller.dart';
import '../../../core/constants/constants.dart';

class UrlsList extends StatelessWidget {
  final List<UrlEntity> urls;
  final DatabaseHelper database;

  const UrlsList(
      this.database,
    this.urls, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final urlPingStatusController = Get.put(UrlPingStatusController());

    for (var url in urls) {
      urlPingStatusController.addUrl(url);
    }

    return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        //padding: const EdgeInsets.all(Dimens.spaceExtraSmall),
        itemCount: urls.length,
        itemBuilder: (BuildContext context, int index) {
          return urlListItem(context, urls[index], database, index + 1);
        },
        separatorBuilder: (BuildContext context, int index) => vSpaceLarge());
  }
}
