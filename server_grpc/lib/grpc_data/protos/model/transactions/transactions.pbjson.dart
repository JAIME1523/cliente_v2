//
//  Generated code. Do not modify.
//  source: transactions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transactionTypeDescriptor instead')
const TransactionType$json = {
  '1': 'TransactionType',
  '2': [
    {'1': 'Sale', '2': 0},
    {'1': 'SaleWithTip', '2': 1},
  ],
};

/// Descriptor for `TransactionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionTypeDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvblR5cGUSCAoEU2FsZRAAEg8KC1NhbGVXaXRoVGlwEAE=');

@$core.Deprecated('Use transactionStatusDescriptor instead')
const TransactionStatus$json = {
  '1': 'TransactionStatus',
  '2': [
    {'1': 'Pending', '2': 0},
    {'1': 'Failed', '2': 1},
    {'1': 'Cancelled', '2': 2},
    {'1': 'Denied', '2': 3},
    {'1': 'Approved', '2': 4},
  ],
};

/// Descriptor for `TransactionStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionStatusDescriptor = $convert.base64Decode(
    'ChFUcmFuc2FjdGlvblN0YXR1cxILCgdQZW5kaW5nEAASCgoGRmFpbGVkEAESDQoJQ2FuY2VsbG'
    'VkEAISCgoGRGVuaWVkEAMSDAoIQXBwcm92ZWQQBA==');

@$core.Deprecated('Use entryModePDescriptor instead')
const EntryModeP$json = {
  '1': 'EntryModeP',
  '2': [
    {'1': 'Manual', '2': 0},
    {'1': 'Magstripe', '2': 1},
    {'1': 'Contact', '2': 2},
    {'1': 'Contactless', '2': 3},
  ],
};

/// Descriptor for `EntryModeP`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List entryModePDescriptor = $convert.base64Decode(
    'CgpFbnRyeU1vZGVQEgoKBk1hbnVhbBAAEg0KCU1hZ3N0cmlwZRABEgsKB0NvbnRhY3QQAhIPCg'
    'tDb250YWN0bGVzcxAD');

@$core.Deprecated('Use cVMResultDescriptor instead')
const CVMResult$json = {
  '1': 'CVMResult',
  '2': [
    {'1': 'CvmPinOk', '2': 0},
    {'1': 'CvmPinFailed', '2': 1},
    {'1': 'CvmSignatureRequired', '2': 2},
    {'1': 'CvmNoVerificationRequired', '2': 3},
    {'1': 'CvmPinOkAndSignatureRequired', '2': 4},
    {'1': 'Unknown', '2': 5},
  ],
};

/// Descriptor for `CVMResult`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cVMResultDescriptor = $convert.base64Decode(
    'CglDVk1SZXN1bHQSDAoIQ3ZtUGluT2sQABIQCgxDdm1QaW5GYWlsZWQQARIYChRDdm1TaWduYX'
    'R1cmVSZXF1aXJlZBACEh0KGUN2bU5vVmVyaWZpY2F0aW9uUmVxdWlyZWQQAxIgChxDdm1QaW5P'
    'a0FuZFNpZ25hdHVyZVJlcXVpcmVkEAQSCwoHVW5rbm93bhAF');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.agnostiko_meta.TransactionStatus', '10': 'status'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.agnostiko_meta.TransactionType', '10': 'type'},
    {'1': 'amount', '3': 3, '4': 1, '5': 5, '10': 'amount'},
    {'1': 'referenceNumber', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'referenceNumber', '17': true},
    {'1': 'arqc', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'arqc', '17': true},
    {'1': 'maskPan', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'maskPan', '17': true},
    {'1': 'authorizationNumber', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'authorizationNumber', '17': true},
    {'1': 'stan', '3': 8, '4': 1, '5': 9, '9': 4, '10': 'stan', '17': true},
    {'1': 'resultCode', '3': 9, '4': 1, '5': 9, '9': 5, '10': 'resultCode', '17': true},
    {'1': 'additionalInformation', '3': 10, '4': 1, '5': 11, '6': '.agnostiko_meta.AdditionalInformation', '9': 6, '10': 'additionalInformation', '17': true},
    {'1': 'secondaryAmount', '3': 11, '4': 1, '5': 1, '9': 7, '10': 'secondaryAmount', '17': true},
  ],
  '8': [
    {'1': '_referenceNumber'},
    {'1': '_arqc'},
    {'1': '_maskPan'},
    {'1': '_authorizationNumber'},
    {'1': '_stan'},
    {'1': '_resultCode'},
    {'1': '_additionalInformation'},
    {'1': '_secondaryAmount'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhI5CgZzdGF0dXMYASABKA4yIS5hZ25vc3Rpa29fbWV0YS5UcmFuc2FjdG'
    'lvblN0YXR1c1IGc3RhdHVzEjMKBHR5cGUYAiABKA4yHy5hZ25vc3Rpa29fbWV0YS5UcmFuc2Fj'
    'dGlvblR5cGVSBHR5cGUSFgoGYW1vdW50GAMgASgFUgZhbW91bnQSLQoPcmVmZXJlbmNlTnVtYm'
    'VyGAQgASgJSABSD3JlZmVyZW5jZU51bWJlcogBARIXCgRhcnFjGAUgASgJSAFSBGFycWOIAQES'
    'HQoHbWFza1BhbhgGIAEoCUgCUgdtYXNrUGFuiAEBEjUKE2F1dGhvcml6YXRpb25OdW1iZXIYBy'
    'ABKAlIA1ITYXV0aG9yaXphdGlvbk51bWJlcogBARIXCgRzdGFuGAggASgJSARSBHN0YW6IAQES'
    'IwoKcmVzdWx0Q29kZRgJIAEoCUgFUgpyZXN1bHRDb2RliAEBEmAKFWFkZGl0aW9uYWxJbmZvcm'
    '1hdGlvbhgKIAEoCzIlLmFnbm9zdGlrb19tZXRhLkFkZGl0aW9uYWxJbmZvcm1hdGlvbkgGUhVh'
    'ZGRpdGlvbmFsSW5mb3JtYXRpb26IAQESLQoPc2Vjb25kYXJ5QW1vdW50GAsgASgBSAdSD3NlY2'
    '9uZGFyeUFtb3VudIgBAUISChBfcmVmZXJlbmNlTnVtYmVyQgcKBV9hcnFjQgoKCF9tYXNrUGFu'
    'QhYKFF9hdXRob3JpemF0aW9uTnVtYmVyQgcKBV9zdGFuQg0KC19yZXN1bHRDb2RlQhgKFl9hZG'
    'RpdGlvbmFsSW5mb3JtYXRpb25CEgoQX3NlY29uZGFyeUFtb3VudA==');

@$core.Deprecated('Use additionalInformationDescriptor instead')
const AdditionalInformation$json = {
  '1': 'AdditionalInformation',
  '2': [
    {'1': 'entryMode', '3': 1, '4': 1, '5': 14, '6': '.agnostiko_meta.EntryModeP', '9': 0, '10': 'entryMode', '17': true},
    {'1': 'cardBrand', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'cardBrand', '17': true},
    {'1': 'transactionDate', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'transactionDate', '17': true},
    {'1': 'isFallback', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'isFallback', '17': true},
    {'1': 'onlineRequested', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'onlineRequested', '17': true},
    {'1': 'cvmType', '3': 6, '4': 1, '5': 14, '6': '.agnostiko_meta.CVMResult', '9': 5, '10': 'cvmType', '17': true},
  ],
  '8': [
    {'1': '_entryMode'},
    {'1': '_cardBrand'},
    {'1': '_transactionDate'},
    {'1': '_isFallback'},
    {'1': '_onlineRequested'},
    {'1': '_cvmType'},
  ],
};

/// Descriptor for `AdditionalInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List additionalInformationDescriptor = $convert.base64Decode(
    'ChVBZGRpdGlvbmFsSW5mb3JtYXRpb24SPQoJZW50cnlNb2RlGAEgASgOMhouYWdub3N0aWtvX2'
    '1ldGEuRW50cnlNb2RlUEgAUgllbnRyeU1vZGWIAQESIQoJY2FyZEJyYW5kGAIgASgJSAFSCWNh'
    'cmRCcmFuZIgBARItCg90cmFuc2FjdGlvbkRhdGUYAyABKAlIAlIPdHJhbnNhY3Rpb25EYXRliA'
    'EBEiMKCmlzRmFsbGJhY2sYBCABKAhIA1IKaXNGYWxsYmFja4gBARItCg9vbmxpbmVSZXF1ZXN0'
    'ZWQYBSABKAhIBFIPb25saW5lUmVxdWVzdGVkiAEBEjgKB2N2bVR5cGUYBiABKA4yGS5hZ25vc3'
    'Rpa29fbWV0YS5DVk1SZXN1bHRIBVIHY3ZtVHlwZYgBAUIMCgpfZW50cnlNb2RlQgwKCl9jYXJk'
    'QnJhbmRCEgoQX3RyYW5zYWN0aW9uRGF0ZUINCgtfaXNGYWxsYmFja0ISChBfb25saW5lUmVxdW'
    'VzdGVkQgoKCF9jdm1UeXBl');

