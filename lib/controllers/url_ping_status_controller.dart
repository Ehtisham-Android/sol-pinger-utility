import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/url_list_item.dart';
import 'package:http/http.dart' as http;

import '../core/constants/constants.dart';

// 142.251.32.46

class UrlPingStatusController extends GetxController {
  var urls = <String, UrlEntity>{}.obs;
  var loading = <String, bool>{}.obs;

  List<UrlEntity> getUrls() {
    List<UrlEntity> urlList = [];
    urls.forEach((key, value) => urlList.add(value));
    return urlList;
  }

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

  // DELETE ////////////////////////////////////////////////////////////////////
  void deleteUrl(int? id) {
    urls[id.toString()];
  }

  void pingUrl(UrlEntity urlEntity, DatabaseHelper database) {
    setIsLoading(urlEntity.id ?? -1, true);

    final ping = Ping(urlEntity.url, count: Constants.pingCount);

    // Preview command that will be run
    if (kDebugMode) {
      print('Running command: ${ping.command}');
    }

    // Begin ping process and listen for output
    var count = 0;
    ping.stream.listen((event) {
      print(event);
      count++;
      if (count == (Constants.pingCount + 1)) {
        if (event.summary != null) {
          var result = updateUrlEntity(urlEntity, event);
          database.insertUrl(result);
          addUrl(result);
        } else if (event.error != null) {
          var result = updateErrorUrlEntity(urlEntity, event.error?.error);
          database.insertUrl(result);
          addUrl(result);
        }
        setIsLoading(urlEntity.id ?? -1, false);
      } else {
        if (event.error != null) {
          var result = updateErrorUrlEntity(urlEntity, event.error?.error);
          database.insertUrl(result);
          addUrl(result);
          setIsLoading(urlEntity.id ?? -1, false);
        }
      }
    });
  }

  void hitUrl(UrlEntity urlEntity, DatabaseHelper database) async {
    print("HitUrl called for: ${urlEntity.url}");
    setIsLoading(urlEntity.id ?? -1, true);

    try {
      //final response = await http.get(Uri.parse('https://${formatUrl(urlEntity.url)}'));
      final response = await http.get(Uri.parse(urlEntity.url));

      var status = STATUSES.FAILED;
      if (response.statusCode == 200) {
        status = STATUSES.SUCCESS;
      }
      var result = updateUrlEntityStatus(urlEntity, status.name);
      database.insertUrl(result);
      addUrl(result);
    } on Exception catch (exception) {
      // only executed if error is of type Exception
      var result = updateUrlEntityStatus(urlEntity, exception.toString());
      database.insertUrl(result);
      addUrl(result);
    } catch (error) {
      // executed for errors of all types other than Exception
      var result = updateUrlEntityStatus(urlEntity, error.toString());
      database.insertUrl(result);
      addUrl(result);
    }

    setIsLoading(urlEntity.id ?? -1, false);
  }

  UrlEntity updateUrlEntity(UrlEntity urlEntity, PingData pingData) {
    print("Hits since: ${urlEntity.hitsSince + 1}");
    var result = UrlEntity(
        id: urlEntity.id,
        url: urlEntity.url,
        noOfTries: urlEntity.noOfTries,
        isHalt: urlEntity.isHalt,
        severity: urlEntity.severity,
        lastChecked: getCurrentDateAndTime(),
        status: pingData.summary!.received >= 3
            ? STATUSES.SUCCESS.name
            : STATUSES.FAILED.name,
        createdAt: urlEntity.createdAt,
        totalFailures: pingData.summary!.received < 3
            ? (urlEntity.totalFailures + 1)
            : urlEntity.totalFailures,
        hitsSince: urlEntity.hitsSince + 1);

    return result;
  }

  UrlEntity updateUrlEntityStatus(UrlEntity urlEntity, String urlHitStatus) {
    var result = UrlEntity(
        id: urlEntity.id,
        url: urlEntity.url,
        noOfTries: urlEntity.noOfTries,
        isHalt: urlEntity.isHalt,
        severity: urlEntity.severity,
        lastChecked: getCurrentDateAndTime(),
        status: urlHitStatus,
        createdAt: urlEntity.createdAt,
        totalFailures: urlHitStatus == STATUSES.FAILED
            ? (urlEntity.totalFailures + 1)
            : urlEntity.totalFailures,
        hitsSince: urlEntity.hitsSince + 1);

    return result;
  }

  UrlEntity updateErrorUrlEntity(UrlEntity urlEntity, ErrorType? error) {
    var result = UrlEntity(
        id: urlEntity.id,
        url: urlEntity.url,
        noOfTries: urlEntity.noOfTries,
        isHalt: urlEntity.isHalt,
        severity: urlEntity.severity,
        lastChecked: getCurrentDateAndTime(),
        status: error?.name ?? STATUSES.FAILED.name,
        createdAt: urlEntity.createdAt,
        totalFailures: (urlEntity.totalFailures + 1),
        hitsSince: (urlEntity.hitsSince + 1));

    return result;
  }

  Future<bool> haltUrlEntity(
      UrlEntity urlEntity, DatabaseHelper database) async {
    var result = UrlEntity(
        id: urlEntity.id,
        url: urlEntity.url,
        noOfTries: urlEntity.noOfTries,
        isHalt: urlEntity.isHalt == 1 ? 0 : 1,
        severity: urlEntity.severity,
        lastChecked: getCurrentDateAndTime(),
        status: urlEntity.status,
        createdAt: urlEntity.createdAt,
        totalFailures: urlEntity.totalFailures,
        hitsSince: urlEntity.hitsSince);

    addUrl(result);
    return await database.insertUrl(result) == 1;
  }

  Future<PingData> startPing(String url) async {
    final result = Ping(url, count: 1);
    final res = await result.stream.first;
    return res;
  }

  Future<PingData?> pingCheck(String url) async {
    // Create ping object with desired args
    final ping = Ping(url, count: 5);

    // [Optional]
    // Preview command that will be run (helpful for debugging)
    print('Running command: ${ping.command}');

    // Begin ping process and listen for output
    PingData? pingData;
    ping.stream.listen((event) {
      print(event);
      pingData = event;
    });

    return pingData;
  }
}

enum STATUSES { SUCCESS, FAILED, PINGING }
