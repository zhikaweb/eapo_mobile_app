import 'dart:io';
import 'dart:convert' as convert;
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

import 'package:eapo_mobile_app/model/credentials.dart';
import 'package:eapo_mobile_app/utils/httpUtils.dart';
import 'package:eapo_mobile_app/utils/networkService.dart';
import 'package:xml/xml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml2json/xml2json.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  Object? message;
  String? baseApplicationId;
  StatusPortal? statusPortal;
  String? profile;
  String? eapoRegNo;
  String? externalRegNo;
  DateTime? eapoRegDate;
  DateTime? externalRegDate;
  String? name;
  String? statusId;
  String? statusName;
  String? expert;
  String? patentNumber;
  @JsonKey(ignore: true)
  PriorityClaims? priorityClaims;
  @JsonKey(ignore: true)
   ClassificationIpcrs? classificationIpcrs;
  @JsonKey(ignore: true)
   Applicants? applicants;
  @JsonKey(ignore: true)
   Inventors? inventors;
  @JsonKey(ignore: true)
   Agents? agents;

  Documents? documents;

  DateTime? pctApplicationDate;
  String? pctApplicationNumber;

  DateTime? woPublicationDate;
  String? woPpublicationNumbe;

  Application(
      this.message,
      this.baseApplicationId,
      this.statusPortal,
      this.profile,
      this.eapoRegNo,
      this.externalRegNo,
      this.eapoRegDate,
      this.externalRegDate,
      this.name,
      this.statusId,
      this.statusName,
      this.expert,
      this.patentNumber,
      this.documents,
      this.pctApplicationDate,
      this.pctApplicationNumber,
      this.woPublicationDate,
      this.woPpublicationNumbe);

  Application.a();

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

}

@JsonSerializable()
class Documents {
  List<Document>? document;

  Documents(this.document);

  factory Documents.fromJson(Map<String, dynamic> json) => _$DocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentsToJson(this);

}

@JsonSerializable()
class Document {
  final String? docCode;
  final DateTime? docDate;
  final String? docType;
  final String? description;
  final String? docId;
  final String? signed;

  Document(this.docCode, this.docDate, this.docType, this.description,
      this.docId, this.signed);

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);

}

@JsonSerializable()
class Agents {
  final List<Agent>? agent;

  Agents(this.agent);

  factory Agents.fromJson(Map<String, dynamic> json) => _$AgentsFromJson(json);

  Map<String, dynamic> toJson() => _$AgentsToJson(this);

}

@JsonSerializable()
class Agent {
  final String? id;
  final String? country;
  final String? lastName;
  final String? firstName;
  final String? middleName;

  Agent(this.id, this.country, this.lastName, this.firstName, this.middleName);

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);

}

@JsonSerializable()
class Inventors {
  final List<Inventor>? inventor;

  Inventors(this.inventor);

  factory Inventors.fromJson(Map<String, dynamic> json) => _$InventorsFromJson(json);

  Map<String, dynamic> toJson() => _$InventorsToJson(this);

}

@JsonSerializable()
class Inventor {
  final String? id;
  final String? country;
  final String? lastName;
  final String? firstName;
  final String? middleName;

  Inventor(
      this.id, this.country, this.lastName, this.firstName, this.middleName);

  factory Inventor.fromJson(Map<String, dynamic> json) => _$InventorFromJson(json);

  Map<String, dynamic> toJson() => _$InventorToJson(this);
}

@JsonSerializable()
class Applicants {
  final Map<String, dynamic>? applicant;

  Applicants(this.applicant);

  factory Applicants.fromJson(Map<String, dynamic> json) => _$ApplicantsFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicantsToJson(this);
}

@JsonSerializable()
class Applicant {
  final String? id;
  final String? country;
  final String? lastName;
  final Object? firstName;
  final Object? middleName;

  Applicant(
      this.id, this.country, this.lastName, this.firstName, this.middleName);

  factory Applicant.fromJson(Map<String, dynamic> json) => _$ApplicantFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicantToJson(this);
}

@JsonSerializable()
class ClassificationIpcrs {
  final List<Classin>? classin;

  ClassificationIpcrs(this.classin);

  factory ClassificationIpcrs.fromJson(Map<String, dynamic> json) => _$ClassificationIpcrsFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationIpcrsToJson(this);

}

@JsonSerializable()
class Classin {
  final String? ipcversion;
  final String? ipcclass;
  final DateTime? dtversion;

  Classin(this.ipcversion, this.ipcclass, this.dtversion);

  factory Classin.fromJson(Map<String, dynamic> json) => _$ClassinFromJson(json);

  Map<String, dynamic> toJson() => _$ClassinToJson(this);
}

@JsonSerializable()
class PriorityClaims {
  final List<Priority>? priority;

  PriorityClaims(this.priority);

  factory PriorityClaims.fromJson(Map<String, dynamic> json) => _$PriorityClaimsFromJson(json);

  Map<String, dynamic> toJson() => _$PriorityClaimsToJson(this);

}

@JsonSerializable()
class Priority {
  final String? noprio;
  final DateTime? dtprio;
  final String? idcountry;

  Priority(this.noprio, this.dtprio, this.idcountry);

  factory Priority.fromJson(Map<String, dynamic> json) => _$PriorityFromJson(json);

  Map<String, dynamic> toJson() => _$PriorityToJson(this);
}

@JsonSerializable()
class StatusPortal {
  final String? id;
  final String? internal;
  final String? name;
  final StatusType? statusType;

  StatusPortal(this.id, this.internal, this.name, this.statusType);

  factory StatusPortal.fromJson(Map<String, dynamic> json) => _$StatusPortalFromJson(json);

  Map<String, dynamic> toJson() => _$StatusPortalToJson(this);
}

@JsonSerializable()
class StatusType {
  final String? id;
  final String? name;

  StatusType(this.id, this.name);

  factory StatusType.fromJson(Map<String, dynamic> json) => _$StatusTypeFromJson(json);

  Map<String, dynamic> toJson() => _$StatusTypeToJson(this);

}

Future<Application> getApplication(Credentials credentials, String appNum) async {

  var response = await http.get(Uri.parse(HttpUtils.urlAppliInfo + appNum), headers: {
    HttpHeaders.authorizationHeader: NetworkService(credentials)
        .calculateAuthentication(),
  }, );
  if (response.statusCode == 200){
    return _createApplicationFromJson(convert.utf8.decode(response.body.codeUnits));
  } else {
    developer.log('код ответа сервера : ' + response.statusCode.toString());
    throw Exception('Error: ${response.reasonPhrase}');
  }
}


Application _createApplicationFromJson(String response){
  Xml2Json xml2json = new Xml2Json();
  var doc = XmlDocument.parse(response).getElement('application').toString();
  developer.log('XmlElement ' + doc);
  xml2json.parse(doc);
  var json = xml2json.toParker();
  developer.log('json: '+ json);
  print(new Application.fromJson(convert.json.decode(json)['application']));

  return new Application.fromJson(convert.json.decode(json)['application']);
}