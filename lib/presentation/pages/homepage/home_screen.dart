import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sol_pinger_utility/core/constants/app_shared_prefs.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/item_space.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/loading_indicator.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_bloc.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_event.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_state.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/urls_list.dart';
import 'package:sol_pinger_utility/presentation/pages/widgets/helper_widgets/snack_bar.dart';
import '../../../controllers/url_ping_status_controller.dart';
import '../../../core/AppGlobals.dart';
import '../../../core/Utils.dart';
import '../../../core/constants/constants.dart';
import '../../../locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/helper_widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(AppLocalizations.of(context)?.appName ?? "Sol Pinger"),
      backgroundColor: AppColors.materialSurfaceColor(context),
      body: _buildBody(context),
    );
  }

  late DatabaseHelper database;
  late AppSharedPref prefs;
  late final UrlPingStatusController urlPingStatusController;
  late final StreamController<int> _stream;
  late int interval;
  late Rx<bool> isScheduleRunning;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(const GetUrlsList());
    database = locator<DatabaseHelper>();
    prefs = locator<AppSharedPref>();
    urlPingStatusController = Get.put(UrlPingStatusController());
    _stream = StreamController<int>();
    interval = prefs.scheduleInterval;
    isScheduleRunning = false.obs;
  }

  Widget _buildBody(BuildContext context) {
    // context.read<HomePageBloc>().add(const GetUrlsList());
    // var database = locator<DatabaseHelper>();
    // var prefs = locator<AppSharedPref>();
    // final urlPingStatusController = Get.put(UrlPingStatusController());
    // final StreamController<int> _stream = StreamController<int>();
    // int interval = prefs.scheduleInterval;
    // Rx<bool> isScheduleRunning = false.obs;
    // Timer? timer;

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
                child: Column(children: [
                  Row(children: [
                    StreamBuilder<int>(
                      stream: _stream.stream,
                      initialData: interval * 60,
                      builder: (context, snapshot) {
                        if(snapshot.data != (interval * 60)){
                          return textSecondaryDarkMedium(
                            maxLines: 2,
                              'Next ping after:\n${formatTime(Duration(seconds: snapshot.data!))}');
                        }

                        return Container();
                      },
                    ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: urlList.isNotEmpty ? () async {
                          // Cron().schedule(Schedule.parse('*/$interval * * * *'),
                          //     () async {
                          //   for (var url in urlList) {
                          //     if (url.isHalt == 0){
                          //       urlPingStatusController.hitUrl(
                          //           urlPingStatusController.getUrl(url.id)!,
                          //           database);
                          //     }
                          //   }
                          // });
                          if(isScheduleRunning.value){
                            timer?.cancel();
                            isScheduleRunning.value = false;
                          } else {
                            timer = startTimer(interval, _stream, urlPingStatusController, database);
                            if(timer?.isActive ?? false){
                              isScheduleRunning.value = true;
                            }
                          }

                        } : null,
                        child: Obx(() => textPrimaryMidMedium(isScheduleRunning.value ? "Stop pinging" : "Start pinging"))),
                  ]),
                  vSpaceMedium(),
                  Expanded(child: UrlsList(database, urlList))
                ])));
      }

      if (state is OnHomePageDeleteUrlError) {
        final urlList = state.oldUrlList;
        final error = state.errorMessage;
        showPostFrameSnackBar(context, error);
        return SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(Dimens.screenPadding),
                child: UrlsList(database, urlList)));
      }

      return Container();
    });
  }

  Timer startTimer(int timeInMinutes, StreamController<int> streamController, UrlPingStatusController controller, DatabaseHelper database) {
    var counter = timeInMinutes * 60;
    final totalTime = counter;
    return Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      streamController.add(counter);

      print("Running timer hashcode: ${timer.hashCode}");
      if (counter == 0) {
        //print('Cancel timer');
        for (var url in controller.getUrls()) {
          if (url.isHalt == 0) {
            controller.hitUrl(
                controller.getUrl(url.id)!, database);
          }
        }
        counter = totalTime;
        //timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: mainAppBar(AppLocalizations.of(context).appName ?? "Sol Pinger"),
//       backgroundColor: AppColors.materialSurfaceColor(context),
//       body: _buildBody(context),
//     );
//   }
//
//   Widget _buildBody(BuildContext context) {
//     context.read<HomePageBloc>().add(const GetUrlsList());
//     var database = locator<DatabaseHelper>();
//     var prefs = locator<AppSharedPref>();
//     final urlPingStatusController = Get.put(UrlPingStatusController());
//     final StreamController<int> _stream = StreamController<int>();
//     int interval = prefs.scheduleInterval;
//     Rx<bool> isScheduleRunning = false.obs;
//     Timer? timer;
//
//     return BlocBuilder<HomePageBloc, HomePageState>(
//         builder: (BuildContext context, state) {
//       if (state is OnHomePageLoading) {
//         return const LoadingIndicator();
//       }
//
//       if (state is OnHomePageSuccess) {
//         final urlList = state.result;
//         return SafeArea(
//             child: Padding(
//                 padding: const EdgeInsets.all(Dimens.screenPadding),
//                 child: Column(children: [
//                   Row(children: [
//                     StreamBuilder<int>(
//                       stream: _stream.stream,
//                       initialData: interval * 60,
//                       builder: (context, snapshot) {
//                         if(snapshot.data != (interval * 60)){
//                           return textSecondaryDarkMedium(
//                             maxLines: 2,
//                               'Next ping after:\n${formatTime(Duration(seconds: snapshot.data!))}');
//                         }
//
//                         return Container();
//                       },
//                     ),
//                     const Spacer(),
//                     ElevatedButton(
//                         onPressed: urlList.isNotEmpty ? () async {
//                           // Cron().schedule(Schedule.parse('*/$interval * * * *'),
//                           //     () async {
//                           //   for (var url in urlList) {
//                           //     if (url.isHalt == 0){
//                           //       urlPingStatusController.hitUrl(
//                           //           urlPingStatusController.getUrl(url.id)!,
//                           //           database);
//                           //     }
//                           //   }
//                           // });
//                           if(isScheduleRunning.value){
//                             timer?.cancel();
//                             isScheduleRunning.value = false;
//                           } else {
//                             timer = startTimer(interval, _stream, urlPingStatusController, database);
//                             if(timer?.isActive ?? false){
//                               isScheduleRunning.value = true;
//                             }
//                           }
//
//                         } : null,
//                         child: Obx(() => textPrimaryMidMedium(isScheduleRunning.value ? "Stop pinging" : "Start pinging"))),
//                   ]),
//                   vSpaceMedium(),
//                   Expanded(child: UrlsList(database, urlList))
//                 ])));
//       }
//
//       if (state is OnHomePageDeleteUrlError) {
//         final urlList = state.oldUrlList;
//         final error = state.errorMessage;
//         showPostFrameSnackBar(context, error);
//         return SafeArea(
//             child: Padding(
//                 padding: const EdgeInsets.all(Dimens.screenPadding),
//                 child: UrlsList(database, urlList)));
//       }
//
//       return Container();
//     });
//   }
//
//   Timer startTimer(int timeInMinutes, StreamController<int> streamController, UrlPingStatusController controller, DatabaseHelper database) {
//     var counter = timeInMinutes * 60;
//     final totalTime = counter;
//     return Timer.periodic(const Duration(seconds: 1), (timer) {
//       //print(timer.tick);
//
//       counter--;
//       streamController.add(counter);
//       if (counter == 0) {
//         //print('Cancel timer');
//         for (var url in controller.getUrls()) {
//           if (url.isHalt == 0) {
//             controller.hitUrl(
//                 controller.getUrl(url.id)!, database);
//           }
//         }
//         counter = totalTime;
//         //timer.cancel();
//       }
//     });
//   }
// }
