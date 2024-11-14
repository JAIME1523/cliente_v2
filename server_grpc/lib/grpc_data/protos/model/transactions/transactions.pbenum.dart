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

class TransactionType extends $pb.ProtobufEnum {
  static const TransactionType Sale = TransactionType._(0, _omitEnumNames ? '' : 'Sale');
  static const TransactionType SaleWithTip = TransactionType._(1, _omitEnumNames ? '' : 'SaleWithTip');

  static const $core.List<TransactionType> values = <TransactionType> [
    Sale,
    SaleWithTip,
  ];

  static final $core.Map<$core.int, TransactionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionType? valueOf($core.int value) => _byValue[value];

  const TransactionType._($core.int v, $core.String n) : super(v, n);
}

class TransactionStatus extends $pb.ProtobufEnum {
  static const TransactionStatus Pending = TransactionStatus._(0, _omitEnumNames ? '' : 'Pending');
  static const TransactionStatus Failed = TransactionStatus._(1, _omitEnumNames ? '' : 'Failed');
  static const TransactionStatus Cancelled = TransactionStatus._(2, _omitEnumNames ? '' : 'Cancelled');
  static const TransactionStatus Denied = TransactionStatus._(3, _omitEnumNames ? '' : 'Denied');
  static const TransactionStatus Approved = TransactionStatus._(4, _omitEnumNames ? '' : 'Approved');

  static const $core.List<TransactionStatus> values = <TransactionStatus> [
    Pending,
    Failed,
    Cancelled,
    Denied,
    Approved,
  ];

  static final $core.Map<$core.int, TransactionStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionStatus? valueOf($core.int value) => _byValue[value];

  const TransactionStatus._($core.int v, $core.String n) : super(v, n);
}

class EntryModeP extends $pb.ProtobufEnum {
  static const EntryModeP Manual = EntryModeP._(0, _omitEnumNames ? '' : 'Manual');
  static const EntryModeP Magstripe = EntryModeP._(1, _omitEnumNames ? '' : 'Magstripe');
  static const EntryModeP Contact = EntryModeP._(2, _omitEnumNames ? '' : 'Contact');
  static const EntryModeP Contactless = EntryModeP._(3, _omitEnumNames ? '' : 'Contactless');

  static const $core.List<EntryModeP> values = <EntryModeP> [
    Manual,
    Magstripe,
    Contact,
    Contactless,
  ];

  static final $core.Map<$core.int, EntryModeP> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EntryModeP? valueOf($core.int value) => _byValue[value];

  const EntryModeP._($core.int v, $core.String n) : super(v, n);
}

class CVMResult extends $pb.ProtobufEnum {
  static const CVMResult CvmPinOk = CVMResult._(0, _omitEnumNames ? '' : 'CvmPinOk');
  static const CVMResult CvmPinFailed = CVMResult._(1, _omitEnumNames ? '' : 'CvmPinFailed');
  static const CVMResult CvmSignatureRequired = CVMResult._(2, _omitEnumNames ? '' : 'CvmSignatureRequired');
  static const CVMResult CvmNoVerificationRequired = CVMResult._(3, _omitEnumNames ? '' : 'CvmNoVerificationRequired');
  static const CVMResult CvmPinOkAndSignatureRequired = CVMResult._(4, _omitEnumNames ? '' : 'CvmPinOkAndSignatureRequired');
  static const CVMResult Unknown = CVMResult._(5, _omitEnumNames ? '' : 'Unknown');

  static const $core.List<CVMResult> values = <CVMResult> [
    CvmPinOk,
    CvmPinFailed,
    CvmSignatureRequired,
    CvmNoVerificationRequired,
    CvmPinOkAndSignatureRequired,
    Unknown,
  ];

  static final $core.Map<$core.int, CVMResult> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CVMResult? valueOf($core.int value) => _byValue[value];

  const CVMResult._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
