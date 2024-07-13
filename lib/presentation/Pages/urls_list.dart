import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

import '../../core/constants/constants.dart';

class UrlsList extends StatelessWidget {
  final List<UrlEntity> urls;

  const UrlsList(
    this.urls, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(Dimens.spaceMedium),
        itemCount: urls.length,
        itemBuilder: (BuildContext context, int index) {
          return item(context, urls[index]);
        },
        separatorBuilder: (BuildContext context, int index) => hSpaceMedium());
  }

  Widget item(BuildContext context, UrlEntity urlEntity) {
    return GestureDetector(
      onTap: () {
        //goToCategoriesScreen(context, category.id, category.name);
      },
      child: SizedBox(
        width: CategoriesItemHeight.subCategoryImageWidth,
        height: CategoriesItemHeight.subCategoryHeight,
        child: Column(
          children: [
            textGreySmall(urlEntity.url)
          ],
        ),
      ),
    );
  }
}
