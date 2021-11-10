// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      json['message'],
      json['baseApplicationId'] as String?,
      json['statusPortal'] == null
          ? null
          : StatusPortal.fromJson(json['statusPortal'] as Map<String, dynamic>),
      json['profile'] as String?,
      json['eapoRegNo'] as String?,
      json['externalRegNo'] as String?,
      json['eapoRegDate'] == null
          ? null
          : DateTime.parse(json['eapoRegDate'] as String),
      json['externalRegDate'] == null
          ? null
          : DateTime.parse(json['externalRegDate'] as String),
      json['name'] as String?,
      json['statusId'] as String?,
      json['statusName'] as String?,
      json['expert'] as String?,
      json['patentNumber'] as String?,
      json['priorityClaims'] == null
          ? null
          : PriorityClaims.fromJson(
              json['priorityClaims'] as Map<String, dynamic>),
      json['classificationIpcrs'] == null
          ? null
          : ClassificationIpcrs.fromJson(
              json['classificationIpcrs'] as Map<String, dynamic>),
      json['applicants'] == null
          ? null
          : Applicants.fromJson(json['applicants'] as Map<String, dynamic>),
      json['inventors'] == null
          ? null
          : Inventors.fromJson(json['inventors'] as Map<String, dynamic>),
      json['agents'] == null
          ? null
          : Agents.fromJson(json['agents'] as Map<String, dynamic>),
      json['documents'] == null
          ? null
          : Documents.fromJson(json['documents'] as Map<String, dynamic>),
      json['pctApplicationDate'] == null
          ? null
          : DateTime.parse(json['pctApplicationDate'] as String),
      json['pctApplicationNumber'] as String?,
      json['woPublicationDate'] == null
          ? null
          : DateTime.parse(json['woPublicationDate'] as String),
      json['woPpublicationNumbe'] as String?,
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'message': instance.message,
      'baseApplicationId': instance.baseApplicationId,
      'statusPortal': instance.statusPortal,
      'profile': instance.profile,
      'eapoRegNo': instance.eapoRegNo,
      'externalRegNo': instance.externalRegNo,
      'eapoRegDate': instance.eapoRegDate?.toIso8601String(),
      'externalRegDate': instance.externalRegDate?.toIso8601String(),
      'name': instance.name,
      'statusId': instance.statusId,
      'statusName': instance.statusName,
      'expert': instance.expert,
      'patentNumber': instance.patentNumber,
      'priorityClaims': instance.priorityClaims,
      'classificationIpcrs': instance.classificationIpcrs,
      'applicants': instance.applicants,
      'inventors': instance.inventors,
      'agents': instance.agents,
      'documents': instance.documents,
      'pctApplicationDate': instance.pctApplicationDate?.toIso8601String(),
      'pctApplicationNumber': instance.pctApplicationNumber,
      'woPublicationDate': instance.woPublicationDate?.toIso8601String(),
      'woPpublicationNumbe': instance.woPpublicationNumbe,
    };

Documents _$DocumentsFromJson(Map<String, dynamic> json) => Documents(
      (json['document'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocumentsToJson(Documents instance) => <String, dynamic>{
      'document': instance.document,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      json['docCode'] as String?,
      json['docDate'] == null
          ? null
          : DateTime.parse(json['docDate'] as String),
      json['docType'] as String?,
      json['description'] as String?,
      json['docId'] as String?,
      json['signed'] as String?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'docCode': instance.docCode,
      'docDate': instance.docDate?.toIso8601String(),
      'docType': instance.docType,
      'description': instance.description,
      'docId': instance.docId,
      'signed': instance.signed,
    };

Agents _$AgentsFromJson(Map<String, dynamic> json) => Agents(
      (json['agent'] as List<dynamic>?)
          ?.map((e) => Agent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgentsToJson(Agents instance) => <String, dynamic>{
      'agent': instance.agent,
    };

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
      json['id'] as String?,
      json['country'] as String?,
      json['lastName'] as String?,
      json['firstName'] as String?,
      json['middleName'] as String?,
    );

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
    };

Inventors _$InventorsFromJson(Map<String, dynamic> json) => Inventors(
      (json['inventor'] as List<dynamic>?)
          ?.map((e) => Inventor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InventorsToJson(Inventors instance) => <String, dynamic>{
      'inventor': instance.inventor,
    };

Inventor _$InventorFromJson(Map<String, dynamic> json) => Inventor(
      json['id'] as String?,
      json['country'] as String?,
      json['lastName'] as String?,
      json['firstName'] as String?,
      json['middleName'] as String?,
    );

Map<String, dynamic> _$InventorToJson(Inventor instance) => <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
    };

Applicants _$ApplicantsFromJson(Map<String, dynamic> json) => Applicants(
      json['applicant'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ApplicantsToJson(Applicants instance) =>
    <String, dynamic>{
      'applicant': instance.applicant,
    };

Applicant _$ApplicantFromJson(Map<String, dynamic> json) => Applicant(
      json['id'] as String?,
      json['country'] as String?,
      json['lastName'] as String?,
      json['firstName'],
      json['middleName'],
    );

Map<String, dynamic> _$ApplicantToJson(Applicant instance) => <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
    };

ClassificationIpcrs _$ClassificationIpcrsFromJson(Map<String, dynamic> json) =>
    ClassificationIpcrs(
      (json['classin'] as List<dynamic>?)
          ?.map((e) => Classin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassificationIpcrsToJson(
        ClassificationIpcrs instance) =>
    <String, dynamic>{
      'classin': instance.classin,
    };

Classin _$ClassinFromJson(Map<String, dynamic> json) => Classin(
      json['ipcversion'] as String?,
      json['ipcclass'] as String?,
      json['dtversion'] == null
          ? null
          : DateTime.parse(json['dtversion'] as String),
    );

Map<String, dynamic> _$ClassinToJson(Classin instance) => <String, dynamic>{
      'ipcversion': instance.ipcversion,
      'ipcclass': instance.ipcclass,
      'dtversion': instance.dtversion?.toIso8601String(),
    };

PriorityClaims _$PriorityClaimsFromJson(Map<String, dynamic> json) =>
    PriorityClaims(
      (json['priority'] as List<dynamic>?)
          ?.map((e) => Priority.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PriorityClaimsToJson(PriorityClaims instance) =>
    <String, dynamic>{
      'priority': instance.priority,
    };

Priority _$PriorityFromJson(Map<String, dynamic> json) => Priority(
      json['noprio'] as String?,
      json['dtprio'] == null ? null : DateTime.parse(json['dtprio'] as String),
      json['idcountry'] as String?,
    );

Map<String, dynamic> _$PriorityToJson(Priority instance) => <String, dynamic>{
      'noprio': instance.noprio,
      'dtprio': instance.dtprio?.toIso8601String(),
      'idcountry': instance.idcountry,
    };

StatusPortal _$StatusPortalFromJson(Map<String, dynamic> json) => StatusPortal(
      json['id'] as String?,
      json['internal'] as String?,
      json['name'] as String?,
      json['statusType'] == null
          ? null
          : StatusType.fromJson(json['statusType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatusPortalToJson(StatusPortal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'internal': instance.internal,
      'name': instance.name,
      'statusType': instance.statusType,
    };

StatusType _$StatusTypeFromJson(Map<String, dynamic> json) => StatusType(
      json['id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$StatusTypeToJson(StatusType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
