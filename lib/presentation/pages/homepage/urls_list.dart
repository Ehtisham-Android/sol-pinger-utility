import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/url_list_item.dart';

import '../../../core/constants/constants.dart';

class UrlsList extends StatelessWidget {
  final List<UrlEntity> urls;

  const UrlsList(
    this.urls, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(Dimens.spaceMedium),
        itemCount: urls.length,
        itemBuilder: (BuildContext context, int index) {
          return urlListItem(context, urls[index]);
        },
        separatorBuilder: (BuildContext context, int index) => vSpaceLarge());
  }
}
