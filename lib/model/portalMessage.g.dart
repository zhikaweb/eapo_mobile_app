// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portalMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalMessage _$PortalMessageFromJson(Map<String, dynamic> json) =>
    PortalMessage(
      json['id'] as int?,
      json['message'] as String?,
      PortalMessage._fromJson(json['creationDate'] as int),
      PortalMessage._fromJson(json['sendingDate'] as int),
      json['status'] as int?,
      json['type'] as String?,
      json['applicationNumber'] as String?,
    );

Map<String, dynamic> _$PortalMessageToJson(PortalMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'creationDate': PortalMessage._toJson(instance.creationDate),
      'sendingDate': PortalMessage._toJson(instance.sendingDate),
      'status': instance.status,
      'type': instance.type,
      'applicationNumber': instance.applicationNumber,
    };
