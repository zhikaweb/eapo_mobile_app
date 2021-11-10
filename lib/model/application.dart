import 'package:xml/xml.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  final Object? message;
  final String? baseApplicationId;
  final StatusPortal? statusPortal;
  final String? profile;
  final String? eapoRegNo;
  final String? externalRegNo;
  // @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? eapoRegDate;
  // @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? externalRegDate;
  final String? name;
  final String? statusId;
  final String? statusName;
  final String? expert;
  final String? patentNumber;
  final PriorityClaims? priorityClaims;
  final ClassificationIpcrs? classificationIpcrs;
  final Applicants? applicants;
  final Inventors? inventors;
  final Agents? agents;
  final Documents? documents;
  // @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? pctApplicationDate;
  final String? pctApplicationNumber;
  // @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? woPublicationDate;
  final String? woPpublicationNumbe;

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
      this.priorityClaims,
      this.classificationIpcrs,
      this.applicants,
      this.inventors,
      this.agents,
      this.documents,
      this.pctApplicationDate,
      this.pctApplicationNumber,
      this.woPublicationDate,
      this.woPpublicationNumbe);

  // factory Application.fromElement(XmlElement element){
  //   return Application(
  //       element.getAttribute('message') == null ? null : Object,
  //       element.getAttribute('baseApplicationId') as int?,
  //       element.getAttribute('statusPortal') as StatusPortal?,
  //       element.getAttribute('profile'),
  //       element.getAttribute('eapoRegNo') as int?,
  //       element.getAttribute('externalRegNo'),
  //       element.getAttribute('eapoRegDate') as DateTime?,
  //       element.getAttribute('externalRegDate') as DateTime?,
  //       element.getAttribute('name'),
  //       element.getAttribute('statusId') as int?,
  //       element.getAttribute('statusName'),
  //       element.getAttribute('expert'),
  //       element.getAttribute('patentNumber'),
  //       element.getAttribute('priorityClaims') as PriorityClaims?,
  //       element.getAttribute('classificationIpcrs') as ClassificationIpcrs?,
  //       element.getAttribute('applicants') as Applicants?,
  //       element.getAttribute('inventors') as Inventors?,
  //       element.getAttribute('agents') as Agents?,
  //       element.getAttribute('documents') as Documents?,
  //       element.getAttribute('pctApplicationDate') as DateTime?,
  //       element.getAttribute('pctApplicationNumber'),
  //       element.getAttribute('woPublicationDate') as DateTime?,
  //       element.getAttribute('woPpublicationNumbe')
  //   );
  // }

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
  static DateTime? _fromJson(int int) => DateTime.fromMillisecondsSinceEpoch(int);
  static int _toJson(DateTime? time) => time!.millisecondsSinceEpoch;
}

@JsonSerializable()
class Documents {
  List<Document>? document;

  Documents(this.document);

  factory Documents.fromJson(Map<String, dynamic> json) => _$DocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentsToJson(this);

  // factory Documents.fromElement(XmlElement element){
  //   return Documents(element.getAttribute('document') as List<Document>?);
  // }
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

  // factory Document.fromElement(XmlElement element) {
  //   return Document(
  //       element.getAttribute('docCode'),
  //       element.getAttribute('docDate') as DateTime?,
  //       element.getAttribute('docType'),
  //       element.getAttribute('description'),
  //       element.getAttribute('docId'),
  //       element.getAttribute('signed') as int?);
  // }
}

@JsonSerializable()
class Agents {
  final List<Agent>? agent;

  Agents(this.agent);

  factory Agents.fromJson(Map<String, dynamic> json) => _$AgentsFromJson(json);

  Map<String, dynamic> toJson() => _$AgentsToJson(this);
  // factory Agents.fromElement(XmlElement element){
  //   return Agents(element.getAttribute('agent') as List<Agent>?);
  // }
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

  // factory Agent.fromElement(XmlElement element){
  //   return Agent(
  //       element.getAttribute('id') as int?,
  //       element.getAttribute('country'),
  //       element.getAttribute('lastName'),
  //       element.getAttribute('firstName'),
  //       element.getAttribute('middleName'));
  // }
}

@JsonSerializable()
class Inventors {
  final List<Inventor>? inventor;

  Inventors(this.inventor);

  factory Inventors.fromJson(Map<String, dynamic> json) => _$InventorsFromJson(json);

  Map<String, dynamic> toJson() => _$InventorsToJson(this);

  // factory Inventors.fromElement(XmlElement element){
  //   return Inventors(element.getAttribute('inventor') as List<Inventor>?);
  // }
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

  // factory Inventor.fromElement(XmlElement element){
  //   return Inventor(
  //       element.getAttribute('id') as int?,
  //       element.getAttribute('country'),
  //       element.getAttribute('lastName'),
  //       element.getAttribute('firstName'),
  //       element.getAttribute('middleName'));
  // }
}

@JsonSerializable()
class Applicants {
  final Map<String, dynamic>? applicant;

  Applicants(this.applicant);

  factory Applicants.fromJson(Map<String, dynamic> json) => _$ApplicantsFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicantsToJson(this);

  // factory Applicants.fromElement(XmlElement element){
  //   return Applicants(element.getAttribute('applicant') as List<Applicant>?);
  // }
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

  // factory Applicant.fromElement(XmlElement element){
  //   return Applicant(
  //       element.getAttribute('id') as int?,
  //       element.getAttribute('country'),
  //       element.getAttribute('lastName'),
  //       element.getAttribute('firstName'),
  //       element.getAttribute('middleName'));
  // }
}

@JsonSerializable()
class ClassificationIpcrs {
  final List<Classin>? classin;

  ClassificationIpcrs(this.classin);

  factory ClassificationIpcrs.fromJson(Map<String, dynamic> json) => _$ClassificationIpcrsFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationIpcrsToJson(this);

  // factory ClassificationIpcrs.fromElement(XmlElement element){
  //   return ClassificationIpcrs(element.getAttribute('classin') as List<Classin>?);
  // }
}

@JsonSerializable()
class Classin {
  final String? ipcversion;
  final String? ipcclass;
  final DateTime? dtversion;

  Classin(this.ipcversion, this.ipcclass, this.dtversion);

  factory Classin.fromJson(Map<String, dynamic> json) => _$ClassinFromJson(json);

  Map<String, dynamic> toJson() => _$ClassinToJson(this);

  // factory Classin.fromElement(XmlElement element){
  //   return Classin(
  //       element.getAttribute('ipcversion') as int?,
  //       element.getAttribute('ipcclass'),
  //       element.getAttribute('dtversion') as DateTime?);
  // }
}

@JsonSerializable()
class PriorityClaims {
  final List<Priority>? priority;

  PriorityClaims(this.priority);

  factory PriorityClaims.fromJson(Map<String, dynamic> json) => _$PriorityClaimsFromJson(json);

  Map<String, dynamic> toJson() => _$PriorityClaimsToJson(this);

   // factory PriorityClaims.fromElement(XmlElement element){
   //   return PriorityClaims(element.getAttribute('priority') as List<Priority>?);
   // }
}

@JsonSerializable()
class Priority {
  final String? noprio;
  final DateTime? dtprio;
  final String? idcountry;

  Priority(this.noprio, this.dtprio, this.idcountry);

  factory Priority.fromJson(Map<String, dynamic> json) => _$PriorityFromJson(json);

  Map<String, dynamic> toJson() => _$PriorityToJson(this);

  // factory Priority.fromElement(XmlElement element){
  //   return Priority(
  //       element.getAttribute('noprio'),
  //       element.getAttribute('dtprio') as DateTime?,
  //       element.getAttribute('idcountry'));
  // }
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

  // factory StatusPortal.fromElement(XmlElement element){
  //   return StatusPortal(
  //       element.getAttribute('id') as int?,
  //       element.getAttribute('internal') as bool,
  //       element.getAttribute('name'),
  //       element.getAttribute('statusType') as StatusType?);
  // }
}

@JsonSerializable()
class StatusType {
  final String? id;
  final String? name;

  StatusType(this.id, this.name);

  factory StatusType.fromJson(Map<String, dynamic> json) => _$StatusTypeFromJson(json);

  Map<String, dynamic> toJson() => _$StatusTypeToJson(this);

  // factory StatusType.fromElement(XmlElement element){
  //   return StatusType(
  //       element.getAttribute('id') as int?,
  //       element.getAttribute('name'));
  // }
}