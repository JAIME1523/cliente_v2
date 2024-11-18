part of 'alert_insert_cubit.dart';

class AlertInsertState {
  final bool canPress;
  final TransactionType transactionTypeSelect;
  final bool dispose;

  AlertInsertState(
      {this.canPress = false,
      this.transactionTypeSelect = TransactionType.Sale,
      this.dispose = true});
  AlertInsertState copyWith({
    bool? canPress,
    TransactionType? transactionTypeSelect,
    bool? dispose,
  }) =>
      AlertInsertState(
        canPress: canPress ?? this.canPress,
        dispose: dispose ?? this.dispose,
        transactionTypeSelect: transactionTypeSelect ?? this.transactionTypeSelect
      );
}
