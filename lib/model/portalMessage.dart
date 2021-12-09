import 'package:eapo_mobile_app/model/portalUser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portalMessage.g.dart';

@JsonSerializable()
class PortalMessage {
  int? id;

  String? message;

  @JsonKey(ignore: true)
  PortalUser? user;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? creationDate;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? sendingDate;

  int? status;

  String? type;

  String? applicationNumber;

  PortalMessage(this.id, this.message, this.creationDate,
      this.sendingDate, this.status, this.type, this.applicationNumber);

  factory PortalMessage.fromJson(Map<String, dynamic> json) => _$PortalMessageFromJson(json);

  Map<String, dynamic> toJson() => _$PortalMessageToJson(this);

  static DateTime? _fromJson(int int) => DateTime.fromMillisecondsSinceEpoch(int);
  static int _toJson(DateTime? time) => time!.millisecondsSinceEpoch;
}