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

  const UrlEntity(
      {this.id,
      required this.url,
      required this.noOfTries,
      required this.isPeriodic});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'noOfTries': noOfTries,
      'isPeriodic': isPeriodic
    };
  }

  factory UrlEntity.fromMap(Map<String, dynamic> map) {
    return UrlEntity(
        id: map['id'],
        url: map['url'],
        noOfTries: map['noOfTries'],
        isPeriodic: map['isPeriodic']);
  }

  @override
  List<Object?> get props => [id, url, noOfTries, isPeriodic];

  factory UrlEntity.fromJson(Map<String, dynamic> json) =>
      _$UrlEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UrlEntityToJson(this);
}
