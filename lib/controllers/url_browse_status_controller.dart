// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import '../core/constants/constants.dart';
// import '../core/database/db_helper.dart';
// import '../domain/entities/url.dart';
//
// // 142.251.32.46
//
// class UrlBrowseStatusController extends GetxController {
//   var urls = <String, UrlEntity>{}.obs;
//   var loading = <String, bool>{}.obs;
//
//   void addUrl(UrlEntity item) {
//     urls[item.id.toString()] = item;
//   }
//
//   UrlEntity? getUrl(int? id) {
//     return urls[id.toString()];
//   }
//
//   // LOADING ///////////////////////////////////////////////////////////////////
//   void setIsLoading(int id, bool state) {
//     loading[id.toString()] = state;
//   }
//
//   bool getIsLoading(int? id) {
//     return loading[id.toString()] ?? false;
//   }
//
//   // DELETE ////////////////////////////////////////////////////////////////////
//   void deleteUrl(int? id) {
//     urls[id.toString()];
//   }
//
//   void BrowseUrl(UrlEntity urlEntity, DatabaseHelper database) {
//     setIsLoading(urlEntity.id ?? -1, true);
//
//     final Browse = Browse(urlEntity.url, count: Constants.BrowseCount);
//
//     // Preview command that will be run
//     if (kDebugMode) {
//       print('Running command: ${Browse.command}');
//     }
//
//     // Begin Browse process and listen for output
//     var count = 0;
//     Browse.stream.listen((event) {
//       print(event);
//       count++;
//       if(count == (Constants.BrowseCount + 1)){
//         if (event.summary != null) {
//           var result = updateUrlEntity(urlEntity, event);
//           database.insertUrl(result);
//           addUrl(result);
//         } else if (event.error != null){
//           var result = updateErrorUrlEntity(urlEntity, event.error?.error);
//           database.insertUrl(result);
//           addUrl(result);
//         }
//         setIsLoading(urlEntity.id ?? -1, false);
//       } else {
//         if (event.error != null){
//           var result = updateErrorUrlEntity(urlEntity, event.error?.error);
//           database.insertUrl(result);
//           addUrl(result);
//           setIsLoading(urlEntity.id ?? -1, false);
//         }
//       }
//     });
//   }
//
//   UrlEntity updateUrlEntity(UrlEntity urlEntity, BrowseData BrowseData) {
//     print("Hits since: ${urlEntity.hitsSince+1}");
//     var result = UrlEntity(
//         id: urlEntity.id,
//         url: urlEntity.url,
//         noOfTries: urlEntity.noOfTries,
//         isPeriodic: urlEntity.isPeriodic,
//         severity: urlEntity.severity,
//         lastChecked: getCurrentDateAndTime(),
//         status: BrowseData.summary!.received >= 3 ? STATUSES.SUCCESS.name : STATUSES.FAILED.name,
//         createdAt: urlEntity.createdAt,
//         totalFailures: BrowseData.summary!.received < 3
//             ? (urlEntity.totalFailures + 1)
//             : urlEntity.totalFailures,
//         hitsSince: urlEntity.hitsSince+1);
//
//     return result;
//   }
//
//   UrlEntity updateErrorUrlEntity(UrlEntity urlEntity, ErrorType? error) {
//     var result = UrlEntity(
//         id: urlEntity.id,
//         url: urlEntity.url,
//         noOfTries: urlEntity.noOfTries,
//         isPeriodic: urlEntity.isPeriodic,
//         severity: urlEntity.severity,
//         lastChecked: getCurrentDateAndTime(),
//         status: error?.name ?? STATUSES.FAILED.name,
//         createdAt: urlEntity.createdAt,
//         totalFailures: (urlEntity.totalFailures + 1),
//         hitsSince: (urlEntity.hitsSince + 1));
//
//     return result;
//   }
//
//   Future<BrowseData> startBrowse(String url) async {
//     final result = Browse(url, count: 1);
//     final res = await result.stream.first;
//     return res;
//   }
//
//   Future<BrowseData?> BrowseCheck(String url) async {
//     // Create Browse object with desired args
//     final Browse = Browse(url, count: 5);
//
//     // [Optional]
//     // Preview command that will be run (helpful for debugging)
//     print('Running command: ${Browse.command}');
//
//     // Begin Browse process and listen for output
//     BrowseData? BrowseData;
//     Browse.stream.listen((event) {
//       print(event);
//       BrowseData = event;
//     });
//
//     return BrowseData;
//   }
// }
//
// enum STATUSES {
//   SUCCESS,
//   FAILED,
//   BrowseING
// }
