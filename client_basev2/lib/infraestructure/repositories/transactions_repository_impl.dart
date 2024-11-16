import 'package:client_basev2/data/datasource/transactions_datasource.dart';
import 'package:client_basev2/data/entities/error_entity.dart.dart';
import 'package:client_basev2/data/respositories/transactions_repository.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {
  final TransactionDataSource dataSource;

  TransactionsRepositoryImpl(this.dataSource);

  @override
  Future<Either<ErrorEntity, bool>> cancelProcessTransaction(String id, {String origin = 'AppV1' }) =>
      dataSource.cancelProcessTransaction(id,origin: origin);

  @override
  Future<Either<ErrorEntity, TransactionStatus>> cancelTransaction( TransactionGRpcModel transactionGRpcModel, {String origin = 'AppV1' }) =>
      dataSource.cancelTransaction(transactionGRpcModel,origin: origin);

  @override
  Future<Either<ErrorEntity, TransactionStatus>> getStatus(String id,{String origin = 'AppV1' }) =>
      dataSource.getStatus(id,origin: origin);

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> getTransaction(String id,{String origin = 'AppV1' }) =>
      dataSource.getTransaction(id,origin: origin);

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> insertTransaction(int amount,
          {TransactionType transactionTypeSelect = TransactionType.Sale,
          String origin = 'AppV1'}) =>
      dataSource.insertTransaction(amount, origin: origin);

  @override
  Future<Either<ErrorEntity, List<int>>> registerClient({required String publicKey,required String randomCode }) =>
      dataSource.registerClient(publicKey: publicKey, randomCode: randomCode);

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> startTransaccion(
          String id, {String origin = 'AppV1' }) =>
      dataSource.startTransaccion(id,origin: origin);
}
