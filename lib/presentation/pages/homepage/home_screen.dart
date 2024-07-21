import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/loading_indicator.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_bloc.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_event.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_state.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/urls_list.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/app_bar.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/snack_bar.dart';
import '../../../core/AppGlobals.dart';
import '../../../core/constants/constants.dart';
import '../../../locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(AppLocalizations.of(context)?.appName ?? "Sol Pinger"),
      backgroundColor: AppColors.materialSurfaceColor(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    context.read<HomePageBloc>().add(const GetUrlsList());
    var database = locator<DatabaseHelper>();

    return BlocBuilder<HomePageBloc, HomePageState>(
        builder: (BuildContext context, state) {
          if (state is OnHomePageLoading) {
            return const LoadingIndicator();
          }

          if (state is OnHomePageSuccess) {
            final urlList = state.result;
            return SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(Dimens.screenPadding),
                    child: UrlsList(database, urlList))
            );
          }

          if (state is OnHomePageDeleteUrlError) {
            final urlList = state.oldUrlList;
            final error = state.errorMessage;
            showPostFrameSnackBar(context, error);
            return SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(Dimens.screenPadding),
                    child: UrlsList(database, urlList))
            );
          }

          return Container();
        }
    );
  }
}