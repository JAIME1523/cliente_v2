import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_grpc/grpc_data/protos/model/transactions/transactions.pbenum.dart';

part 'alert_insert_state.dart';

class AlertInsertCubit extends Cubit<AlertInsertState> {
  AlertInsertCubit() : super(AlertInsertState());
  ExpansionTileController controller = ExpansionTileController();
  TextEditingController amountControl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  validate() {
    emit(state.copyWith(canPress: formKey.currentState!.validate()));
  }

  selectType(TransactionType type) {
    emit(state.copyWith(transactionTypeSelect: type));
    controller.collapse();
  }

}
