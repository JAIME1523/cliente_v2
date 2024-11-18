import 'package:client_basev2/presentation/bloc/provider.dart';
import 'package:client_basev2/presentation/views/views.dart';
import 'package:client_basev2/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';
import 'package:server_grpc/server_grpc.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<TransactionsBloc>();
    final watch = context.watch<TransactionsBloc>().state;

    return watch.isPrcessTransac
        ? const PregressTransaction()
        : Column(
            children: [
              FilledButton(
                  onPressed: () => ShowService.alert(
                          content: AlertInser(
                        onPressed: (monto, type) =>
                            read.add(InsertAndSatrt(amount: monto, type: type)),
                      )),
                  child: const Text('fast transacccion')),
              FilledButton(
                  onPressed: () => ShowService.alert(
                          content: AlertInser(
                        showType: true,
                        onPressed: (monto, type) => read
                            .add(InsertTransaction(amount: monto, type: type)),
                      )),
                  child: const Text('Inregsar transacccion')),
              FilledButton(
                  onPressed: () async =>
                      await ShowService.alert(content: SearchId(
                        onPressed: (value) {
                          read.add(StartTransaction(id: value));
                        },
                      )),
                  child: const Text('Iniciar transacccion')),
              FilledButton(
                  onPressed: () async => await ShowService.alert(
                          content: SearchId(
                        onPressed: read.getStatus,
                      )),
                  child: const Text('Estatus de transaccion')),
              FilledButton(
                  onPressed: () async => _search(read),
                  child: const Text('Get Transaction')),
              if (watch.listTransactions.isNotEmpty)
                FilledButton(
                    onPressed: () async => ShowService.alert(
                          content: AlertListTransaction(
                            search: (value) async => _searchInfo(value, read),
                            transacions: watch.listTransactions.values.toList(),
                            cancel: (value) =>read.add(CancelTransaction(transaction: value)),
                            startTransac: (value) => read.add(StartTransaction(id: value)),
                          ),
                        ),
                    child: const Text('transacciones registradas')),
            ],
          );
  }

  _search(TransactionsBloc read) async {
    await ShowService.alert<TransactionGRpcModel?>(
        content: SearchId(
      onPressed: read.getTransaction,
    )).then((value) {
      if (value == null) return;
      ShowService.alert(content: AlerInfo(transacion: value));
    });
  }

  _searchInfo(String id, TransactionsBloc read) async {
    final transac = await read.getTransaction(id);
    if (transac == null) return;
    ShowService.alert(content: AlerInfo(transacion: transac));
  }
}
