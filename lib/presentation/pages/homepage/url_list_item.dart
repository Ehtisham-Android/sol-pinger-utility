import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/core/AppGlobals.dart';
import 'package:sol_pinger_utility/core/Utils.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

import '../../../core/constants/constants.dart';
import '../widgets/helper_widgets/rounded_container.dart';

//DateTime now = DateTime.now();
//String date = "${DateFormat.yMMMEd().format(now)} ${DateFormat.j().format(now)}";

Widget urlListItem(BuildContext context, UrlEntity urlEntity) {
  return GestureDetector(
    onTap: () {
      //goToCategoriesScreen(context, category.id, category.name);
    },
    child: SizedBox(
      width: getScreenWidth(context),
      child: Column(
        children: [
          Row(
              children: [
                RoundedContainer(
                    width: Dimens.iconMedium,
                    radius: Dimens.radiusSmall,
                    padding: const EdgeInsets.all(Dimens.spaceSmall),
                    backgroundColor: AppColors.yellow.withOpacity(0.8), child: textBlackSmall(urlEntity.id.toString())),
                hSpaceLarge(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textTurquoiseXLarge(urlEntity.url, bold: true),
                    textGreyMedium("Last checked: ${urlEntity.lastChecked}"),
                    textGreySmall("Created at: ${urlEntity.createdAt}"),
                  ],
                ),
                const Spacer(),
                textGreyExtraSmall(urlEntity.severity, bold: true),
                hSpaceLarge(),
                Column(children: [
                  RoundedContainer(
                      width: Dimens.iconSmall,
                      height: Dimens.iconSmall,
                      radius: Dimens.radiusXXLarge,
                      backgroundColor: getStatusColor(urlEntity))
                ]),
              ]
          ),
          vSpaceSmall(),
          const Divider(color: AppColors.border_color)
        ]
      ),
    ),
  );
}

Color getStatusColor(UrlEntity urlEntity){
  if (urlEntity.status == "success"){
    return AppColors.green;
  }

  return AppColors.red;
}