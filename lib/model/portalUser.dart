import 'package:json_annotation/json_annotation.dart';

part 'portalUser.g.dart';

@JsonSerializable()
class PortalUser {
  final String? userId;
  final String? userName;
  final List roles;
  final String? userSurName;
  final String? userMail;
  final String? fullUserName;
  final String? fullUserDescription;
  final int? type;
  final int? agentId;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? phone;
  final String? fax;
  final String? email;
  final String? address;
  final String? description;
  final String? country;
  final String? organization;
  final String? position;
  final bool? emailNotification;
  final int? agreementStatus;
  final int? idMember;
  final List? represents;
  final List<Account>? accounts;
  final bool? external;
  final bool? attorneyConfirmed;
  final bool? representativeConfirmed;
  final Account? activeAccount;
  final bool? insider;

  PortalUser(
      this.userId,
      this.userName,
      this.roles,
      this.userSurName,
      this.userMail,
      this.fullUserName,
      this.fullUserDescription,
      this.type,
      this.agentId,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phone,
      this.fax,
      this.email,
      this.address,
      this.description,
      this.country,
      this.organization,
      this.position,
      this.emailNotification,
      this.agreementStatus,
      this.idMember,
      this.represents,
      this.accounts,
      this.external,
      this.attorneyConfirmed,
      this.representativeConfirmed,
      this.activeAccount,
      this.insider);

  factory PortalUser.fromJson(Map<String, dynamic> json) => _$PortalUserFromJson(json);

  Map<String, dynamic> toJson() => _$PortalUserToJson(this);

}

@JsonSerializable()
class Account {
  final int? id;
  final String? userId;
  final String? number;
  final String? name;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? date;
  final bool? active;
  final int? order;

  Account(this.id, this.userId, this.number, this.name, this.date, this.active,
      this.order);

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
  static DateTime? _fromJson(int int) => DateTime.fromMillisecondsSinceEpoch(int);
  static int _toJson(DateTime? time) => time!.millisecondsSinceEpoch;



}

