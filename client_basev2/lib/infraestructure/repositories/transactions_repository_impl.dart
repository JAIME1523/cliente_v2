import 'package:client_basev2/data/datasource/transactions_datasource.dart';
import 'package:client_basev2/data/entities/error_entity.dart.dart';
import 'package:client_basev2/data/respositories/transactions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:server_grpc/database/models/transaction_grpc_model.dart';
import 'package:server_grpc/grpc_data/protos/model/transactions/transactions.pbenum.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {
  final TransactionDataSource dataSource;

  TransactionsRepositoryImpl(this.dataSource);

  @override
  Future<Either<ErrorEntity, bool>> cancelProcessTransaction(String id) =>
      dataSource.cancelProcessTransaction(id);

  @override
  Future<Either<ErrorEntity, TransactionType>> cancelTransaction(
          TransactionGRpcModel transactionGRpcModel) =>
      dataSource.cancelTransaction(transactionGRpcModel);

  @override
  Future<Either<ErrorEntity, TransactionType>> getStatus(String id) =>
      dataSource.getStatus(id);

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> getTransaction(String id) =>
      dataSource.getTransaction(id);

  @override
  Future<Either<ErrorEntity, String>> insertTransaction(int amount,
          {TransactionType transactionTypeSelect = TransactionType.Sale,
          String origin = 'AppV1'}) =>
      dataSource.insertTransaction(amount, origin: origin);

  @override
  Future<Either<ErrorEntity, List<int>>> registerClient(String id) =>
      dataSource.registerClient(id);

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> startTransaccion(
          String id) =>
      dataSource.startTransaccion(id);
}
