import 'dart:convert';

import 'package:server_grpc/database/models/data_model.dart';
import 'package:server_grpc/grpc_data/protos/model/transactions/transactions.pbenum.dart';
import 'transaction_grpc_model.dart';

class AdditionalInformationModel extends DataDbM {
  String? idDetail;
  EntryModeP? entryMode;
  String? cardBrand;
  String? transactionDate;
  bool?   isFallback;
  bool? onlineRequested;
  String? idProto;
  CVMResult? cvmType;

  AdditionalInformationModel({this.cardBrand, this.entryMode, this.transactionDate, this.idDetail, this.isFallback, this.onlineRequested,  this.idProto, this.cvmType});

  AdditionalInformationModel copyWith({
  String? idDetail,
    EntryModeP? entryMode,
    String? cardBrand,
    String? transactionDate,
   bool?   isFallback,
  bool? onlineRequested,
  String? idProto,
  CVMResult? cvmType,

  }) =>
      AdditionalInformationModel(
        idDetail: idDetail ?? this.idDetail,
          cardBrand: cardBrand ?? this.cardBrand,
          entryMode: entryMode ?? this.entryMode,
          transactionDate: transactionDate ?? this.transactionDate,
          isFallback: isFallback ?? this.isFallback,
          onlineRequested: onlineRequested?? this.onlineRequested,
          idProto: idProto  ?? this.idProto,
          cvmType: cvmType ?? this.cvmType
          );

  factory AdditionalInformationModel.fromJson(String str) =>
      AdditionalInformationModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());
  String toJsonGrpc() => json.encode(toMapGrpc());

  factory AdditionalInformationModel.fromMap(Map<String, dynamic> json) =>
      AdditionalInformationModel(
        idDetail: json["idDetail"].toString(),
        cardBrand: json['cardBrand'],
        entryMode: entryModePValues.map[json['entryMode']],
        transactionDate: json['transactionDate'],
        isFallback: json["isFallback"] == 1 ? true: false,
        onlineRequested: json["onlineRequested"]== 1 ? true: false,
        idProto:json["idProto"],
        cvmType: entryCvmlues.map[json["cvmType"]] ,
      );
  @override
  Map<String, dynamic> toMap() => {
        //"transactionId": transactionId,
        "cardBrand": cardBrand,
        "entryMode": entryModePValues.reverse[entryMode] ,
        "transactionDate": transactionDate,
        "isFallback": isFallback != null ?  isFallback! ? 1:0 : null,
        "onlineRequested": onlineRequested != null ?  onlineRequested! ? 1:0 : null,
        "idProto": idProto,
        "cvmType": entryCvmlues.reverse[cvmType] ,

      };

  factory AdditionalInformationModel.fromMapByGrpc(Map<String, dynamic> json) {
    return AdditionalInformationModel(
      // transactionId: json["transactionId"],
      //idProto             : json["1"],
      entryMode: json["1"] == null ? null : EntryModeP.valueOf(json["1"]),
      cardBrand: json["2"],
      transactionDate: json['3'],
      isFallback: json["4"],
      onlineRequested : json["5"],
      cvmType: json["6"] == null ? null : CVMResult.valueOf(json["6"]),

    );
  }
  Map<String, dynamic> toMapGrpc() => {
        if (entryMode != null) "1": entryMode!.value,
        if (cardBrand != null) "2": cardBrand,
        if (transactionDate != null) "3": transactionDate,
        if (isFallback != null) "4": isFallback,
        if (onlineRequested != null) "5": onlineRequested,
        if (cvmType != null) "6": cvmType!.value,
      };


 static EntryModeP?  entrytoEntryP(int position) => EntryModeP.valueOf(position);
      
}


final entryModePValues = EnumValues({
  "Manual": EntryModeP.Manual,
  "Magstripe": EntryModeP.Magstripe,
  "Contact": EntryModeP.Contact,
  "Contactless": EntryModeP.Contactless,
});

final entryCvmlues = EnumValues({
  "CvmNoVerificationRequired": CVMResult.CvmNoVerificationRequired,
  "CvmPinFailed": CVMResult.CvmPinFailed,
  "CvmPinOk": CVMResult.CvmPinOk,
  "CvmPinOkAndSignatureRequired": CVMResult.CvmPinOkAndSignatureRequired,
  "CvmSignatureRequired": CVMResult.CvmSignatureRequired,
  "Unknown": CVMResult.Unknown,
});