import 'package:equatable/equatable.dart';
import 'package:server_grpc/server_grpc.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}


class AthFailure extends Failure {
  const AthFailure(super.message, {required this.status, this.errorCode});
  final bool status;
  final  MetaErrorCode? errorCode;


  @override
  List<Object?> get props => [message];
}
