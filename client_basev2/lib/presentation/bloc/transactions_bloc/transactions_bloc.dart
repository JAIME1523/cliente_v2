import 'dart:ui';

import 'package:client_basev2/infraestructure/infraestructure.dart';
import 'package:client_basev2/infraestructure/utils/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_service/nav_service.dart';
import 'package:server_grpc/server_grpc.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final dataSour = TransactionsRepositoryImpl(TransactionGrpcDatasource());

  TransactionsBloc() : super(const TransactionsState()) {
    on<InsertTransaction>(_onInsertTransasction);
    on<StartTransaction>(_onStartTransaction);
    on<CancelTransaction>(_onCancel);
    on<ProgressTransaction>(_onProgress);
    on<CancelProggressTransaction>(_cancelProggress);
    on<InsertAndSatrt>(_onInsertStart);
    on<Close>(
      (event, emit) => emit(state.copyWith(listTransactions: {})),
    );
  }
  _onInsertStart(InsertAndSatrt event, Emitter<TransactionsState> emit) async {
    final tempMap = <String, TransactionGRpcModel>{};
    final result = await dataSour.insertTransaction(event.amount,
        transactionTypeSelect: event.type);
    if (result.isLeft()) {
      SnackService.showSnackbarError(result.asLefth().errorMesage);
      return null;
    }
    final transac = result.asRight();
    tempMap[transac.idProtoTransaction ?? ""] = transac;
    emit(state
        .copyWith(listTransactions: {...state.listTransactions, ...tempMap}));
    add(StartTransaction(id: transac.idProtoTransaction ?? ""));
  }

  _onInsertTransasction(
      InsertTransaction event, Emitter<TransactionsState> emit) async {
    final tempMap = <String, TransactionGRpcModel>{};

    final result = await dataSour.insertTransaction(event.amount,
        transactionTypeSelect: event.type);
    if (result.isLeft()) {
      SnackService.showSnackbarError(result.asLefth().errorMesage);
      return null;
    }
    final transac = result.asRight();
    tempMap[transac.idProtoTransaction ?? ""] = transac;
    emit(state
        .copyWith(listTransactions: {...state.listTransactions, ...tempMap}));
    SnackService.showSnackbar(
      "Se resgistro con id ${transac.idProtoTransaction}",
    );
  }

  _onStartTransaction(
      StartTransaction event, Emitter<TransactionsState> emit) async {
        
    emit(state.copyWith(isPrcessTransac: true, showButton: false));
      Future.delayed(const Duration(seconds: 2)).then((value) {
     emit(state.copyWith(showButton: true));
    }); 
    add(ProgressTransaction(true));
    final result = await dataSour.startTransaccion(event.id);
    add(ProgressTransaction(false));
    if (result.isLeft()) {
      final error = result.asLefth();
      SnackService.showSnackbarError(error.errorMesage);
      if (error.transaction != null) {
        state.listTransactions.update(event.id, (value) => error.transaction!);
        emit(state.copyWith(listTransactions: state.listTransactions));
        return;
      }
      final getT = await getTransaction(event.id);
      if (getT == null) return;
      state.listTransactions[getT.idProtoTransaction ?? ""] = getT;
      emit(state.copyWith(listTransactions: state.listTransactions));
      return;
    }
    state.listTransactions.update(event.id, (value) => result.asRight());
    emit(state.copyWith(listTransactions: state.listTransactions));
    SnackService.showSnackbar("Se realizo transaction");
  }

  _onCancel(CancelTransaction event, Emitter<TransactionsState> emit) async {
    add(ProgressTransaction(true));
    final result = await dataSour.cancelTransaction(event.transaction);
    add(ProgressTransaction(false));
    if (result.isLeft()) {
      SnackService.showSnackbarError(result.asLefth().errorMesage);
      return;
    }
    state.listTransactions.update(event.transaction.idProtoTransaction ?? "",
        (value) => event.transaction.copyWith(status: result.asRight()));
    emit(state.copyWith(listTransactions: state.listTransactions));
    SnackService.showSnackbar("Se realizo transaction");
  }

  _onProgress(ProgressTransaction event, Emitter<TransactionsState> emit) {
    emit(state.copyWith(isPrcessTransac: event.value));
  }

  _cancelProggress(
      CancelProggressTransaction event, Emitter<TransactionsState> emit) async {
     emit(state.copyWith(activeButon: true));
       
    final result = await dataSour.cancelProcessTransaction();
     emit(state.copyWith(activeButon: false));

    if (result.isLeft()) return;
    if (result.asRight()) emit(state.copyWith(isPrcessTransac: false));
  }

  Future<TransactionGRpcModel?> getTransaction(String id) async {
    final result = await dataSour.getTransaction(id.trim());
    if (result.isLeft()) {
      SnackService.showSnackbarError(result.asLefth().errorMesage);
      return null;
    }
    return result.asRight();
  }

  Future<void> getStatus(String id) async {
    final result = await dataSour.getStatus(id.trim());
    if (result.isLeft()) {
      SnackService.showSnackbarError(result.asLefth().errorMesage);
      return;
    }
    SnackService.showSnackbar(result.asRight().name,
        backgroundColor: _selectColor(result.asRight()));
  }

  Color _selectColor(TransactionStatus statu) {
    switch (statu) {
      case TransactionStatus.Approved:
        return Colors.green;
      case TransactionStatus.Cancelled:
      case TransactionStatus.Denied:
      case TransactionStatus.Failed:
        return Colors.red;
      case TransactionStatus.Pending:
        return Colors.blue;
      default:
        return Colors.blue;
    }
  }
}
