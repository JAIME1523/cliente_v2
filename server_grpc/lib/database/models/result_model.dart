import 'dart:convert';
import 'package:server_grpc/database/models/data_model.dart';

class ResultTransaction extends DataDbM {
  final String idProto;
  final String dataResult;

  ResultTransaction({
    required this.idProto,
    required this.dataResult,
  });

  ResultTransaction copyWith({
    String? id,
    String? dataResult,
  }) =>
      ResultTransaction(
        idProto     : id ?? idProto,
        dataResult  : dataResult ?? this.dataResult,
      );

  factory ResultTransaction.fromJson(String str) =>
      ResultTransaction.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory ResultTransaction.fromMap(Map<String, dynamic> json) =>
      ResultTransaction(
        idProto     : json["idProto"],
        dataResult  : json["dataResult"],
      );
  @override
  Map<String, dynamic> toMap() => {
        "idProto"     : idProto,
        "dataResult"  : dataResult,
      };
}
