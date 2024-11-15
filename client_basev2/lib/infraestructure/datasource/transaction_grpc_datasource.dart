import 'package:client_basev2/data/datasource/transactions_datasource.dart';
import 'package:client_basev2/data/entities/error_entity.dart.dart';
import 'package:dartz/dartz.dart';
import 'package:server_grpc/database/models/transaction_grpc_model.dart';
import 'package:server_grpc/grpc_data/protos/model/transactions/transactions.pbenum.dart';

class TransactionGrpcDatasource  extends TransactionDataSource{
  @override
  Future<Either<ErrorEntity, bool>> cancelProcessTransaction(String id) {
    // TODO: implement cancelProcessTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorEntity, TransactionType>> cancelTransaction(TransactionGRpcModel transactionGRpcModel) {
    // TODO: implement cancelTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorEntity, TransactionType>> getStatus(String id) {
    // TODO: implement getStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> getTransaction(String id) {
    // TODO: implement getTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorEntity, String>> insertTransaction(int amount, {TransactionType transactionTypeSelect = TransactionType.Sale, String origin = 'AppV1'}) {
    // TODO: implement insertTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorEntity, List<int>>> registerClient(String id) {
    // TODO: implement registerClient
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> startTransaccion(String id) {
    // TODO: implement startTransaccion
    throw UnimplementedError();
  }
}