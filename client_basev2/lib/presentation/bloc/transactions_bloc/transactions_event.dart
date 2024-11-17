part of 'transactions_bloc.dart';

sealed class TransactionsEvent {}

class InsertTransaction extends TransactionsEvent {
  final int amount;
  final TransactionType type;
  InsertTransaction({required this.amount, this.type = TransactionType.Sale});
}

class GetStatus extends TransactionsEvent {
  final String id;
  GetStatus({required this.id});
}

class GetTransaction extends TransactionsEvent {
  final String id;
  GetTransaction({required this.id});
}

class StartTransaction extends TransactionsEvent{
  final String id;
  StartTransaction({required this.id});
}

class CancelTransaction extends TransactionsEvent{
  final TransactionGRpcModel transaction;
  CancelTransaction({required this.transaction});
}

class CancelProggressTransaction extends TransactionsEvent{
  CancelProggressTransaction();
}



class ProgressTransaction extends TransactionsEvent{
  final bool value;
  ProgressTransaction(this.value);
}