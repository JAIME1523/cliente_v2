import 'package:client_basev2/data/entities/error_entity.dart.dart';
import 'package:server_grpc/server_grpc.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionDataSource{
  Future<Either<ErrorEntity, String>> insertTransaction(int amount, {TransactionType transactionTypeSelect = TransactionType.Sale,String origin = 'AppV1' });
  Future<Either<ErrorEntity, TransactionGRpcModel>> getTransaction(String id);
  Future<Either<ErrorEntity, TransactionType>> getStatus(String id);
  Future<Either<ErrorEntity, TransactionType>> startTransaccion(String id);


  Future<Either<ErrorEntity, List<int>>> registerClient(String id);
  Future<Either<ErrorEntity, TransactionType>> cancelTransaction(TransactionGRpcModel transactionGRpcModel);
  Future<Either<ErrorEntity, bool>> cancelProcessTransaction(String id);


  


  





}