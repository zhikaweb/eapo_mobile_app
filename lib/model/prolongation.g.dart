// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prolongation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prolongation _$ProlongationFromJson(Map<String, dynamic> json) => Prolongation(
      json['valid'] as bool?,
      json['monthPayments'] as Map<String, dynamic>?,
      json['corresp'] == null
          ? null
          : Corresp.fromJson(json['corresp'] as Map<String, dynamic>),
      (json['benefit'] as num?)?.toDouble(),
      json['message'] as String?,
    );

Map<String, dynamic> _$ProlongationToJson(Prolongation instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'monthPayments': instance.monthPayments,
      'corresp': instance.corresp,
      'benefit': instance.benefit,
      'message': instance.message,
    };

Corresp _$CorrespFromJson(Map<String, dynamic> json) => Corresp(
      json['idappli'] as String?,
      json['odcorresp'] as int?,
      json['odhisto'] as int?,
      json['oddtdue'] as int?,
      json['idletter'] as String?,
      json['dtsend'] == null ? null : Corresp._fromJson(json['dtsend'] as int),
      json['idexaminer'] as int?,
      json['dtlimit'] as String?,
      json['months'] as String?,
      json['descletter'] as String?,
    );

Map<String, dynamic> _$CorrespToJson(Corresp instance) => <String, dynamic>{
      'idappli': instance.idappli,
      'odcorresp': instance.odcorresp,
      'odhisto': instance.odhisto,
      'oddtdue': instance.oddtdue,
      'idletter': instance.idletter,
      'dtsend': Corresp._toJson(instance.dtsend),
      'idexaminer': instance.idexaminer,
      'dtlimit': instance.dtlimit,
      'months': instance.months,
      'descletter': instance.descletter,
    };
