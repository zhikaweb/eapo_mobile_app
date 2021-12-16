import 'package:json_annotation/json_annotation.dart';

part 'prolongation.g.dart';

@JsonSerializable()
class Prolongation {
  bool? valid;
  Map<String, dynamic>? monthPayments;
  Corresp? corresp;
  double? benefit;
  String? message;

  Prolongation(
      this.valid, this.monthPayments, this.corresp, this.benefit, this.message);

  factory Prolongation.fromJson(Map<String, dynamic> json) => _$ProlongationFromJson(json);

  Map<String, dynamic> toJson() => _$ProlongationToJson(this);
}

@JsonSerializable()
class Corresp {
  String? idappli;
  int? odcorresp;
  int? odhisto;
  int? oddtdue;
  String? idletter;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? dtsend;
  int? idexaminer;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  String? dtlimit;
  String? months;
  String? descletter;

  Corresp(
      this.idappli,
      this.odcorresp,
      this.odhisto,
      this.oddtdue,
      this.idletter,
      this.dtsend,
      this.idexaminer,
      this.dtlimit,
      this.months,
      this.descletter);

  factory Corresp.fromJson(Map<String, dynamic> json) => _$CorrespFromJson(json);

  Map<String, dynamic> toJson() => _$CorrespToJson(this);

  static DateTime? _fromJson(int int) => DateTime.fromMillisecondsSinceEpoch(int);
  static int _toJson(DateTime? time) => time!.millisecondsSinceEpoch;
}