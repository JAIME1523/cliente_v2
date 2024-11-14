import 'dart:convert';

import 'package:server_grpc/database/models/additional_information_model.dart';
import 'package:server_grpc/database/models/data_model.dart';
import 'package:server_grpc/grpc_data/grpc_data.dart';

class TransactionGRpcModel extends DataDbM {
   
  final String? idProtoTransaction;

  final TransactionStatus? status;
  TransactionType? type;
  final int amount;
  String? referenceNumber;
  String? arqc;
  String? maskPan;
  String? authorizationNumber;
  String? stan;
  String? resultCode;
  final double? secondaryAmount;
  AdditionalInformationModel?  additionalInformation;

  TransactionGRpcModel( 
      {
      this.status,
      this.type,
      this.idProtoTransaction,
      required this.amount,
      this.referenceNumber,
      this.arqc,
      this.maskPan,
      this.authorizationNumber,
      this.stan,
      this.resultCode,
      this.additionalInformation,
      this.secondaryAmount,
      });

  TransactionGRpcModel copyWith({
    TransactionStatus? status,
    TransactionType? type,
    int? amount,
    String? referenceNumber,
    String? arqc,
    String? idProtoTransaction,
    String? maskPan,
    String? authorizationNumber,
    String? stan,
    String? resultCode,
    EntryModeP? entryMode,
    String? transactionDate,
     AdditionalInformationModel? additionalInformation,
   double? secondaryAmount,

  }) =>
      TransactionGRpcModel(
          status              : status ?? this.status,
          type                : type ?? this.type,
          amount              : amount ?? this.amount,
          referenceNumber     : referenceNumber ?? this.referenceNumber,
          arqc                : arqc ?? this.arqc,
          maskPan             : maskPan ?? this.maskPan,
          idProtoTransaction  : idProtoTransaction ?? this.idProtoTransaction,
          authorizationNumber : authorizationNumber ?? this.authorizationNumber,
          stan                : stan ?? this.stan,
          resultCode          : resultCode ?? this.resultCode,
          additionalInformation           : additionalInformation?? this.additionalInformation,
          secondaryAmount: secondaryAmount?? this.secondaryAmount
          );

  factory TransactionGRpcModel.fromJson(String str) =>
      TransactionGRpcModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());
  String toJsonModels() => json.encode(toMapModel());

  String toJsonGrpc() => json.encode(toMapGrpc());

  factory TransactionGRpcModel.fromMap(Map<String, dynamic> json) =>
      TransactionGRpcModel(
        // transactionId: json["transactionId"],
        status              : statusValues.map[json["status"]]!,
        type                : typeValues.map[json["type"]],
        amount              : int.tryParse(json["amount"].toString()) ?? 0,
        referenceNumber     : json["referenceNumber"],
        arqc                : json["arqc"],
        maskPan             : json["maskPan"],
        idProtoTransaction  : json["idProto"],
        authorizationNumber : json["authorizationNumber"],
        stan                : json['stan'],
        resultCode          : json['resultCode'],
        secondaryAmount     :  json['secondaryAmount'] == null ? null:double.tryParse(json['secondaryAmount']) ?? 0
      //  additionalInformation  : json['additionalInformation'] == null ? null  :     AdditionalInformationModel.fromJson( json['additionalInformation'])  ,

      );
  factory TransactionGRpcModel.fromMapByGrpc(Map<String, dynamic> json) {
    return TransactionGRpcModel(
      // transactionId: json["transactionId"],
      //idProto             : json["1"],
      status              : TransactionStatus.valueOf(json["1"]),
      type                : TransactionType.valueOf(json["2"]),
      amount              : json["3"],
      referenceNumber     : json["4"],
      arqc                : json["5"],
      maskPan             : json["6"],
      authorizationNumber : json["7"],
      stan                : json["8"],
      resultCode          : json['9'],
      additionalInformation  : json["10"] == null ? null:  AdditionalInformationModel.fromMapByGrpc(json["10"]),
      secondaryAmount     : double.tryParse(json["11"].toString())

    );
  }
  @override
  Map<String, dynamic> toMap() => {
        //"transactionId": transactionId,
        "idProto"             : idProtoTransaction,
        "status"              : statusValues.reverse[status],
        "type"                : typeValues.reverse[type],
        "amount"              : amount,
        "referenceNumber"     : referenceNumber,
        "arqc"                : arqc,
        "maskPan"             : maskPan,
        "authorizationNumber" : authorizationNumber,
        "stan"                : stan,
        "resultCode"          :resultCode,
        "secondaryAmount"     : secondaryAmount,
      };

        Map<String, dynamic> toMapModel() => {
        //"transactionId": transactionId,
        "idProto"             : idProtoTransaction,
        "status"              : statusValues.reverse[status],
        "type"                : typeValues.reverse[type],
        "amount"              : amount,
        "referenceNumber"     : referenceNumber,
        "arqc"                : arqc,
        "maskPan"             : maskPan,
        "authorizationNumber" : authorizationNumber,
        "stan"                : stan,
        "resultCode"          :resultCode,
       "additionalInformation": additionalInformation != null ? additionalInformation!.toMap() : null  ,
       "secondaryAmount"      : secondaryAmount,
      };
  Map<String, dynamic> toMapGrpc() => {
        //"transactionId": transactionId,
        //"1": idProto,
        "1": status!.value,
        "2": type!.value,
        "3": amount,
        if (referenceNumber != null)       "4"  : referenceNumber,
        if (arqc != null)                  "5"  : arqc!.length >=6 ?  arqc!.replaceRange(0, arqc!.length-4, _maskText(arqc!.length-4)) :arqc ,
        if (maskPan != null)               "6"  : maskPan,
        if (authorizationNumber != null)   "7"  : authorizationNumber,
        if (stan != null)                  "8"  : stan,
        if (resultCode!=null)              "9"  : resultCode,
        if (additionalInformation!=null)   "10" : additionalInformation!.toMapGrpc(),
        if(secondaryAmount != null)        "11" : secondaryAmount
      };

     String _maskText(int number){
        List mask = [];
        for (var i = 0; i < number; i++) {
          mask.add("*");
        }
        return mask.join();
      }
}

final typeValues = EnumValues({
  "Sale": TransactionType.Sale,
  "SaleWithTip": TransactionType.SaleWithTip,
});

final statusValues = EnumValues({
  "Pending"   : TransactionStatus.Pending,
  "Failed"    : TransactionStatus.Failed,
  "Cancelled" : TransactionStatus.Cancelled,
  "Denied"    : TransactionStatus.Denied,
  "Approved"  : TransactionStatus.Approved,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
