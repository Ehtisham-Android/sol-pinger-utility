import 'dart:convert';

import 'package:dart_ping/dart_ping.dart';
import 'package:get/get.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/url_list_item.dart';

class UrlPingStatusController extends GetxController {
  var urls = <String, UrlEntity>{}.obs;
  var loading = <String, bool>{}.obs;

  void addUrl(UrlEntity item) {
    urls[item.id.toString()] = item;
  }

  UrlEntity? getUrl(int? id) {
    return urls[id.toString()];
  }

  // LOADING ///////////////////////////////////////////////////////////////////
  void setIsLoading(int id, bool state) {
    loading[id.toString()] = state;
  }

  bool getIsLoading(int? id) {
    return loading[id.toString()] ?? false;
  }

  // DELETE
  void deleteUrl(int? id) {
    urls[id.toString()];
  }

  void pingUrl(UrlEntity urlEntity, DatabaseHelper database) async {
    setIsLoading(urlEntity.id ?? -1, true);

    var pingData = await startPing(urlEntity.url);
    var result = updateUrlEntity(urlEntity, pingData);
    database.insertUrl(result);

    setIsLoading(urlEntity.id ?? -1, false);
  }

  UrlEntity updateUrlEntity(UrlEntity urlEntity, PingData pingData) {
    var result = UrlEntity(
        id: urlEntity.id,
        url: urlEntity.url,
        noOfTries: urlEntity.noOfTries,
        isPeriodic: urlEntity.isPeriodic,
        severity: urlEntity.severity,
        lastChecked: getCurrentDateAndTime(),
        status: pingData.summary!.received > 0 ? "Success" : "Failed",
        createdAt: urlEntity.createdAt,
        totalFailures: pingData.summary!.received > 0
            ? urlEntity.totalFailures
            : (urlEntity.totalFailures + 1),
        hitsSince: urlEntity.hitsSince + 1);

    return result;
  }

  Future<PingData> startPing(String url) async {
    final result = await Ping(url,
            count: 1, encoding: const Utf8Codec(allowMalformed: true))
        .stream
        .first;
    return result;
  }
}
