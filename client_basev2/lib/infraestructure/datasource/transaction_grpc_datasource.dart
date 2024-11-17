import 'package:client_basev2/data/datasource/transactions_datasource.dart';
import 'package:client_basev2/data/entities/error_entity.dart.dart';
import 'package:client_basev2/infraestructure/infraestructure.dart';
import 'package:grpc/grpc.dart';
import 'package:server_grpc/logger/logger_printer.dart';
class TransactionGrpcDatasource extends TransactionDataSource {
  static final logger = getLogger(TransactionGrpcDatasource);

  ClientChannel initChane() {
    ClientChannel channel = ClientChannel(
      LocalStorage.getIpAdrres(),
      port: LocalStorage.getPort(),
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    return channel;
  }

  @override
  Future<Either<ErrorEntity, bool>> cancelProcessTransaction({String origin = 'AppV1'}) async {
    final channel = initChane();
    try {
      final auth = await AtuhDataSerice.generateNewAuth(TypeAuth.counter);
      final response = await MetaAppClient(channel).cancelProcessTransaction(
          CancelProcessRequest(authData: auth, origin: origin));
      await channel.shutdown();
      if (response.hasError()) return Left(_error(response.error));;
      return const Right(true);
    } catch (e) {
      await channel.shutdown();
      logger.e(e);
      return left(ErrorEntity(errorMesage: "Error en el cliente"));
    }
  }

  @override
  Future<Either<ErrorEntity, TransactionStatus>> cancelTransaction(TransactionGRpcModel transactionGRpcModel, {String origin = 'AppV1'}) async {
    final channel = initChane();
    try {
      final auth = await AtuhDataSerice.generateNewAuth(TypeAuth.stanCounte,
          stan: transactionGRpcModel.stan);
      final event =
          await MetaAppClient(channel).cancelTransaction(CancelRequest(
        id: transactionGRpcModel.idProtoTransaction,
        transaction: Transaction.fromJson(transactionGRpcModel.toJsonGrpc()),
        authData: auth,
        origin: origin,
      ));
      await channel.shutdown();
      if (event.hasError()) return Left(_error(event.error));
      if (!event.hasAuthData()) return Left(_error(event.error));

      final isValid = await AtuhDataSerice.validate(
          typeAuth: TypeAuth.counterStatus,
          authData: event.authData,
          status: event.status);
      if (isValid.isLeft()) return _errorValid();
      return Right(event.status);
    } catch (e) {
      await channel.shutdown();
      logger.e(e);
      return left(ErrorEntity(errorMesage: "Error en el cliente"));
    }
  }

  @override
  Future<Either<ErrorEntity, TransactionStatus>> getStatus(String id, {String origin = 'AppV1'}) async {
    final channel = initChane();
    try {
      final auth = await AtuhDataSerice.generateNewAuth(TypeAuth.counter);
      final response = await MetaAppClient(channel)
          .getStatus(GetStatusRequest(id: id, authData: auth, origin: origin));
      await channel.shutdown();
      if (response.hasError()) return Left(_error(response.error));
      if (!response.hasAuthData()) return _errorValid();

      final isValid = await AtuhDataSerice.validate(
          typeAuth: TypeAuth.counterStatus,
          authData: response.authData,
          status: response.status);
      if (isValid.isLeft()) return _errorValid();
      return Right(response.status);
    } catch (e) {
      await channel.shutdown();
      logger.e(e);
      return left(ErrorEntity(errorMesage: "Error en el cliente"));
    }
  }

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> getTransaction(String id,{String origin = 'AppV1'}) async {
    final channel = initChane();
    try {
      final auth = await AtuhDataSerice.generateNewAuth(TypeAuth.counter);
      final response = await MetaAppClient(channel).getTransaction(
          GetTransactionRequest(authData: auth, id: id, origin: origin));
      await channel.shutdown();
      if (response.hasError()) return Left(_error(response.error));
      if (!response.hasAuthData()) return _errorValid();
      final isValid = await AtuhDataSerice.validate(
          typeAuth: TypeAuth.counterStatus,
          authData: response.authData,
          status: response.transaction.status);
      if (isValid.isLeft()) return _errorValid();
      return Right(TransactionGRpcModel.fromMapByGrpc(
              response.transaction.writeToJsonMap())
          .copyWith(idProtoTransaction: id));
    } catch (e) {
      logger.e(e);
      await channel.shutdown();
      return left(ErrorEntity(errorMesage: "Error en la peticion"));
    }
  }

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> insertTransaction(int amount,{TransactionType transactionTypeSelect = TransactionType.Sale,String origin = 'AppV1'}) async {
    final channel = initChane();

    try {
      final auth = await AtuhDataSerice.generateNewAuth(TypeAuth.counterAmount,
          amount: '$amount');
      final transac = Transaction(
        amount: amount,
        status: TransactionStatus.Pending,
        type: TransactionType.Sale,
      );
      final response = await MetaAppClient(channel).registerTransaction(
          RegisterTransactionRequest(
              transaction: transac, authData: auth, origin: origin));
      await channel.shutdown();
      if (response.hasError()) {
        return Left(_error(response.error));
      }
      final isValid = await AtuhDataSerice.validate(
        typeAuth: TypeAuth.counter,
        authData: response.authData,
      );
      if (isValid.isLeft()) {
        return Left(ErrorEntity(errorMesage: "No se puede autenticar"));
      }

      return Right(TransactionGRpcModel.fromMapByGrpc(transac.writeToJsonMap())
          .copyWith(idProtoTransaction: response.id));
    } catch (e) {
      await channel.shutdown();
      logger.e(e);
      return left(ErrorEntity(errorMesage: "Error en el cliente"));
    }
  }

  @override
  Future<Either<ErrorEntity, TransactionGRpcModel>> startTransaccion(String id,{String origin = 'AppV1'}) async {
    final channel = initChane();

    try {
      final auth = await AtuhDataSerice.generateNewAuth(TypeAuth.counter);
      final event =
          await MetaAppClient(channel).startTransaction(StartTransactionRequest(
        id: id,
        authData: auth,
        origin: origin,
      ));
      await channel.shutdown();
      if (event.hasError()) {
        return   Left(_error(event.error,
            transaction:
                TransactionGRpcModel.fromMapByGrpc(event.writeToJsonMap())
                    .copyWith(idProtoTransaction: event.id)));
      }
      if (!event.hasAuthData()) {
        return _errorValid();
      }
      final isValid = await AtuhDataSerice.validate(
          typeAuth: TypeAuth.counterStatus,
          authData: event.authData,
          status: event.transaction.status);
      if (isValid.isLeft()) return _errorValid();
      return Right(TransactionGRpcModel.fromMapByGrpc(event.writeToJsonMap())
          .copyWith(idProtoTransaction: event.id));
    } catch (e) {
      await channel.shutdown();
      logger.e(e);
      return left(ErrorEntity(errorMesage: "Error en el cliente"));
    }
  }

  @override
  Future<Either<ErrorEntity, List<int>>> registerClient({required String publicKey, required String randomCode}) async {
    final channel = initChane();
    try {
      final response = await MetaAppClient(channel).registerClient(
          RegisterClientRequest(publicKey: publicKey, randomCode: randomCode));
      await channel.shutdown();
      if (response.hasError() && !response.hasMacKey()) {
        return Left(ErrorEntity(errorMesage: response.error.errorMsg));
      }
      return Right(response.macKey);
    } catch (e) {
      await channel.shutdown();
      logger.e(e);
      return left(ErrorEntity(errorMesage: "Error en el cliente"));
    }
  }

  ErrorEntity _error(MetaError error, {TransactionGRpcModel? transaction}) {
    return  ErrorEntity(
        errorMesage: error.errorMsg,
        errorCode: error.code,
        transaction: transaction);
  }

  _errorValid({bool isIncrement = false}) async {
    if (isIncrement) await LocalStorage.getSaveCounter();
    return Left(ErrorEntity(errorMesage: "No se puede autenticar"));
  }
}