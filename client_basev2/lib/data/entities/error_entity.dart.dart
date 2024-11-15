import 'package:server_grpc/server_grpc.dart';

class ErrorEntity {
 final String errorMesage;
 final MetaErrorCode? errorCode;
  final TransactionGRpcModel? transaction;

  ErrorEntity({required this.errorMesage,  this.transaction, this.errorCode});

}