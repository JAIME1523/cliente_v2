import 'dart:convert';
import 'package:server_grpc/database/models/data_model.dart';

class WaitingTransactionModel extends DataDbM {
  final String idProto;
  final bool isCancel;

  WaitingTransactionModel({
    required this.idProto,
    required this.isCancel,
  });

  WaitingTransactionModel copyWith({
    String? idProto,
    bool? isCancel,
  }) =>
      WaitingTransactionModel(
        idProto   : idProto ?? this.idProto,
        isCancel  : isCancel ?? this.isCancel,
      );

  factory WaitingTransactionModel.fromJson(String str) =>
      WaitingTransactionModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory WaitingTransactionModel.fromMap(Map<String, dynamic> json) =>
      WaitingTransactionModel(
        idProto   : json["idProto"],
        isCancel  : json["isCancel"] == 1 ? true : false,
      );

  @override
  Map<String, dynamic> toMap() => {
        "idProto"   : idProto,
        "isCancel"  : isCancel ? 1 : 0,
      };
}
