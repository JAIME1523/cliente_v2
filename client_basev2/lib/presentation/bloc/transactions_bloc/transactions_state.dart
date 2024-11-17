part of 'transactions_bloc.dart';

class TransactionsState extends Equatable {
  final Map<String, TransactionGRpcModel> listTransactions;
  final bool isPrcessTransac;
  final bool activeButon;
  final bool showButton;

  const TransactionsState(
      {this.listTransactions = const {},
      this.isPrcessTransac = false,
      this.activeButon = false,
      this.showButton = false});
  TransactionsState copyWith({
    Map<String, TransactionGRpcModel>? listTransactions,
    bool? isPrcessTransac,
    bool? activeButon,
    bool? showButton,
  }) =>
      TransactionsState(
        activeButon: activeButon ?? this.activeButon,
        isPrcessTransac: isPrcessTransac ?? this.isPrcessTransac,
        listTransactions: listTransactions?? this.listTransactions,
        showButton: showButton ?? this.showButton

      );

  @override
  List<Object> get props =>
      [listTransactions, isPrcessTransac, activeButon, showButton];
}
