import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'url.g.dart';

@JsonSerializable()
class UrlEntity extends Equatable {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "url")
  final String url;

  @JsonKey(name: "no_of_tries")
  final int noOfTries;

  @JsonKey(name: "is_periodic")
  final String isPeriodic;

  @JsonKey(name: "severity")
  final String severity;

  @JsonKey(name: "last_checked")
  final String lastChecked;

  @JsonKey(name: "status")
  final String status;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "total_failures")
  final int totalFailures;

  @JsonKey(name: "hits_since")
  final int hitsSince;

  const UrlEntity(
      {this.id,
      required this.url,
      required this.noOfTries,
      required this.isPeriodic,
      required this.severity,
      required this.lastChecked,
      required this.status,
      required this.createdAt,
      required this.totalFailures,
      required this.hitsSince});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'noOfTries': noOfTries,
      'isPeriodic': isPeriodic,
      'severity': severity,
      'lastChecked': lastChecked,
      'status': status,
      'createdAt': createdAt,
      'totalFailures': totalFailures,
      'hitsSince': hitsSince
    };
  }

  factory UrlEntity.fromMap(Map<String, dynamic> map) {
    return UrlEntity(
      id: map['id'],
      url: map['url'],
      noOfTries: map['noOfTries'],
      isPeriodic: map['isPeriodic'],
      severity: map['severity'],
      lastChecked: map['lastChecked'],
      status: map['status'],
      createdAt: map['createdAt'],
      totalFailures: map['totalFailures'],
      hitsSince: map['hitsSince'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        url,
        noOfTries,
        isPeriodic,
        severity,
        lastChecked,
        status,
        createdAt,
        totalFailures,
        hitsSince
      ];

  factory UrlEntity.fromJson(Map<String, dynamic> json) =>
      _$UrlEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UrlEntityToJson(this);
}
