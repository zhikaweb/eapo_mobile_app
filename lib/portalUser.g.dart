// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portalUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalUser _$PortalUserFromJson(Map<String, dynamic> json) => PortalUser(
      json['userId'] as String?,
      json['userName'] as String?,
      json['roles'] as List<dynamic>,
      json['userSurName'] as String?,
      json['userMail'] as String?,
      json['fullUserName'] as String?,
      json['fullUserDescription'] as String?,
      json['type'] as int?,
      json['agentId'] as int?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['middleName'] as String?,
      json['phone'] as String?,
      json['fax'] as String?,
      json['email'] as String?,
      json['address'] as String?,
      json['description'] as String?,
      json['country'] as String?,
      json['organization'] as String?,
      json['position'] as String?,
      json['emailNotification'] as bool?,
      json['agreementStatus'] as int?,
      json['idMember'] as int?,
      json['represents'] as List<dynamic>?,
      (json['accounts'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['external'] as bool?,
      json['attorneyConfirmed'] as bool?,
      json['representativeConfirmed'] as bool?,
      json['activeAccount'] == null
          ? null
          : Account.fromJson(json['activeAccount'] as Map<String, dynamic>),
      json['insider'] as bool?,
    );

Map<String, dynamic> _$PortalUserToJson(PortalUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'roles': instance.roles,
      'userSurName': instance.userSurName,
      'userMail': instance.userMail,
      'fullUserName': instance.fullUserName,
      'fullUserDescription': instance.fullUserDescription,
      'type': instance.type,
      'agentId': instance.agentId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'phone': instance.phone,
      'fax': instance.fax,
      'email': instance.email,
      'address': instance.address,
      'description': instance.description,
      'country': instance.country,
      'organization': instance.organization,
      'position': instance.position,
      'emailNotification': instance.emailNotification,
      'agreementStatus': instance.agreementStatus,
      'idMember': instance.idMember,
      'represents': instance.represents,
      'accounts': instance.accounts,
      'external': instance.external,
      'attorneyConfirmed': instance.attorneyConfirmed,
      'representativeConfirmed': instance.representativeConfirmed,
      'activeAccount': instance.activeAccount,
      'insider': instance.insider,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['id'] as int?,
      json['userId'] as String?,
      json['number'] as String?,
      json['name'] as String?,
      Account._fromJson(json['date'] as int),
      json['active'] as bool?,
      json['order'] as int?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'number': instance.number,
      'name': instance.name,
      'date': Account._toJson(instance.date),
      'active': instance.active,
      'order': instance.order,
    };
