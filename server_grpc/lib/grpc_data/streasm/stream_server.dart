import 'dart:async';
import 'package:server_grpc/server_grpc.dart';

class StreamServer {
  StreamServer._instance();
  static final StreamServer _singleton = StreamServer._instance();
  factory StreamServer() => _singleton;

  static StreamController<TransactionNotification> controllers =StreamController.broadcast();
  static Stream<TransactionNotification> streamProto = controllers.stream;

  static StreamController<CancelNotification> controllerCacel =StreamController.broadcast();
  static Stream<CancelNotification> streamCancelation = controllerCacel.stream;

  static OriginGrpcModel? transactionOrigin;
  static String? idCancel;
  static bool isMatching = false;
  static dynamic transactionBlocs ;

  static cleanTransac() async {
    await controllers.close();
    transactionOrigin = null;
    transactionBlocs = null;
  }

  static cleanCacnelStream() async {
    await controllerCacel.close();
    idCancel = null;
    transactionBlocs = null;
  }

 static  getBloc<T>(value ){
  transactionBlocs = value as T ;
  }


}
