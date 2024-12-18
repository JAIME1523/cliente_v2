  import 'package:client_basev2/data/entities/error_entity.dart.dart';
import 'package:dartz/dartz.dart';
import 'package:server_grpc/server_grpc.dart';

abstract class TransactionsRepository {
  Future<Either<ErrorEntity, TransactionGRpcModel>> insertTransaction(int amount, {required TransactionType transactionTypeSelect,String origin = 'AppV1' });
  Future<Either<ErrorEntity, TransactionGRpcModel>> getTransaction(String id,{String origin = 'AppV1' });
  Future<Either<ErrorEntity, TransactionStatus>> getStatus(String id,{String origin = 'AppV1' });
  Future<Either<ErrorEntity, TransactionGRpcModel>> startTransaccion(String id, {String origin = 'AppV1' });

  Future<Either<ErrorEntity, List<int>>> registerClient( {required String publicKey,required String randomCode });
  Future<Either<ErrorEntity, TransactionStatus>> cancelTransaction(TransactionGRpcModel transactionGRpcModel,{String origin = 'AppV1' });
  Future<Either<ErrorEntity, bool>> cancelProcessTransaction({String origin = 'AppV1' });
  }