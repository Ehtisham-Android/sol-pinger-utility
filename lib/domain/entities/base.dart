import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base.g.dart';

@JsonSerializable()
class BaseEntity extends Equatable {

  @JsonKey(name: "success")
  final bool success;

  @JsonKey(name: "message")
  final String message;

  const BaseEntity({required this.success, required this.message});

  @override
  List<Object?> get props => [success, message];

  factory BaseEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseEntityToJson(this);
}