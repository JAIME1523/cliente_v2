//
//  Generated code. Do not modify.
//  source: transactions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'transactions.pbenum.dart';

export 'transactions.pbenum.dart';

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    TransactionStatus? status,
    TransactionType? type,
    $core.int? amount,
    $core.String? referenceNumber,
    $core.String? arqc,
    $core.String? maskPan,
    $core.String? authorizationNumber,
    $core.String? stan,
    $core.String? resultCode,
    AdditionalInformation? additionalInformation,
    $core.double? secondaryAmount,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (type != null) {
      $result.type = type;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (referenceNumber != null) {
      $result.referenceNumber = referenceNumber;
    }
    if (arqc != null) {
      $result.arqc = arqc;
    }
    if (maskPan != null) {
      $result.maskPan = maskPan;
    }
    if (authorizationNumber != null) {
      $result.authorizationNumber = authorizationNumber;
    }
    if (stan != null) {
      $result.stan = stan;
    }
    if (resultCode != null) {
      $result.resultCode = resultCode;
    }
    if (additionalInformation != null) {
      $result.additionalInformation = additionalInformation;
    }
    if (secondaryAmount != null) {
      $result.secondaryAmount = secondaryAmount;
    }
    return $result;
  }
  Transaction._() : super();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'agnostiko_meta'), createEmptyInstance: create)
    ..e<TransactionStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: TransactionStatus.Pending, valueOf: TransactionStatus.valueOf, enumValues: TransactionStatus.values)
    ..e<TransactionType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TransactionType.Sale, valueOf: TransactionType.valueOf, enumValues: TransactionType.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'referenceNumber', protoName: 'referenceNumber')
    ..aOS(5, _omitFieldNames ? '' : 'arqc')
    ..aOS(6, _omitFieldNames ? '' : 'maskPan', protoName: 'maskPan')
    ..aOS(7, _omitFieldNames ? '' : 'authorizationNumber', protoName: 'authorizationNumber')
    ..aOS(8, _omitFieldNames ? '' : 'stan')
    ..aOS(9, _omitFieldNames ? '' : 'resultCode', protoName: 'resultCode')
    ..aOM<AdditionalInformation>(10, _omitFieldNames ? '' : 'additionalInformation', protoName: 'additionalInformation', subBuilder: AdditionalInformation.create)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'secondaryAmount', $pb.PbFieldType.OD, protoName: 'secondaryAmount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction clone() => Transaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction)) as Transaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(TransactionStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  TransactionType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(TransactionType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get amount => $_getIZ(2);
  @$pb.TagNumber(3)
  set amount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get referenceNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set referenceNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReferenceNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearReferenceNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get arqc => $_getSZ(4);
  @$pb.TagNumber(5)
  set arqc($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasArqc() => $_has(4);
  @$pb.TagNumber(5)
  void clearArqc() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get maskPan => $_getSZ(5);
  @$pb.TagNumber(6)
  set maskPan($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaskPan() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaskPan() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get authorizationNumber => $_getSZ(6);
  @$pb.TagNumber(7)
  set authorizationNumber($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAuthorizationNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthorizationNumber() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get stan => $_getSZ(7);
  @$pb.TagNumber(8)
  set stan($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStan() => $_has(7);
  @$pb.TagNumber(8)
  void clearStan() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get resultCode => $_getSZ(8);
  @$pb.TagNumber(9)
  set resultCode($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasResultCode() => $_has(8);
  @$pb.TagNumber(9)
  void clearResultCode() => clearField(9);

  @$pb.TagNumber(10)
  AdditionalInformation get additionalInformation => $_getN(9);
  @$pb.TagNumber(10)
  set additionalInformation(AdditionalInformation v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAdditionalInformation() => $_has(9);
  @$pb.TagNumber(10)
  void clearAdditionalInformation() => clearField(10);
  @$pb.TagNumber(10)
  AdditionalInformation ensureAdditionalInformation() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.double get secondaryAmount => $_getN(10);
  @$pb.TagNumber(11)
  set secondaryAmount($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSecondaryAmount() => $_has(10);
  @$pb.TagNumber(11)
  void clearSecondaryAmount() => clearField(11);
}

class AdditionalInformation extends $pb.GeneratedMessage {
  factory AdditionalInformation({
    EntryModeP? entryMode,
    $core.String? cardBrand,
    $core.String? transactionDate,
    $core.bool? isFallback,
    $core.bool? onlineRequested,
    CVMResult? cvmType,
  }) {
    final $result = create();
    if (entryMode != null) {
      $result.entryMode = entryMode;
    }
    if (cardBrand != null) {
      $result.cardBrand = cardBrand;
    }
    if (transactionDate != null) {
      $result.transactionDate = transactionDate;
    }
    if (isFallback != null) {
      $result.isFallback = isFallback;
    }
    if (onlineRequested != null) {
      $result.onlineRequested = onlineRequested;
    }
    if (cvmType != null) {
      $result.cvmType = cvmType;
    }
    return $result;
  }
  AdditionalInformation._() : super();
  factory AdditionalInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdditionalInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdditionalInformation', package: const $pb.PackageName(_omitMessageNames ? '' : 'agnostiko_meta'), createEmptyInstance: create)
    ..e<EntryModeP>(1, _omitFieldNames ? '' : 'entryMode', $pb.PbFieldType.OE, protoName: 'entryMode', defaultOrMaker: EntryModeP.Manual, valueOf: EntryModeP.valueOf, enumValues: EntryModeP.values)
    ..aOS(2, _omitFieldNames ? '' : 'cardBrand', protoName: 'cardBrand')
    ..aOS(3, _omitFieldNames ? '' : 'transactionDate', protoName: 'transactionDate')
    ..aOB(4, _omitFieldNames ? '' : 'isFallback', protoName: 'isFallback')
    ..aOB(5, _omitFieldNames ? '' : 'onlineRequested', protoName: 'onlineRequested')
    ..e<CVMResult>(6, _omitFieldNames ? '' : 'cvmType', $pb.PbFieldType.OE, protoName: 'cvmType', defaultOrMaker: CVMResult.CvmPinOk, valueOf: CVMResult.valueOf, enumValues: CVMResult.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdditionalInformation clone() => AdditionalInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdditionalInformation copyWith(void Function(AdditionalInformation) updates) => super.copyWith((message) => updates(message as AdditionalInformation)) as AdditionalInformation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdditionalInformation create() => AdditionalInformation._();
  AdditionalInformation createEmptyInstance() => create();
  static $pb.PbList<AdditionalInformation> createRepeated() => $pb.PbList<AdditionalInformation>();
  @$core.pragma('dart2js:noInline')
  static AdditionalInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdditionalInformation>(create);
  static AdditionalInformation? _defaultInstance;

  @$pb.TagNumber(1)
  EntryModeP get entryMode => $_getN(0);
  @$pb.TagNumber(1)
  set entryMode(EntryModeP v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEntryMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntryMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cardBrand => $_getSZ(1);
  @$pb.TagNumber(2)
  set cardBrand($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCardBrand() => $_has(1);
  @$pb.TagNumber(2)
  void clearCardBrand() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get transactionDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set transactionDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransactionDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionDate() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isFallback => $_getBF(3);
  @$pb.TagNumber(4)
  set isFallback($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsFallback() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsFallback() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get onlineRequested => $_getBF(4);
  @$pb.TagNumber(5)
  set onlineRequested($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOnlineRequested() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineRequested() => clearField(5);

  @$pb.TagNumber(6)
  CVMResult get cvmType => $_getN(5);
  @$pb.TagNumber(6)
  set cvmType(CVMResult v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCvmType() => $_has(5);
  @$pb.TagNumber(6)
  void clearCvmType() => clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
