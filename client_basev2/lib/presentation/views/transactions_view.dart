import 'package:client_basev2/presentation/bloc/provider.dart';
import 'package:client_basev2/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';
import 'package:server_grpc/server_grpc.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.watch<TransactionsBloc>();
    return Column(
      children: [
        FilledButton(
            onPressed: () async {
 


            },
            child: const Text('moto')),
        FilledButton(
            onPressed: () async {
              await ShowService.alert(
                  content: SearchId(
                onPressed: read.getStatus,
              ));
            },
            child: const Text('Estatus de transaccion')),
        FilledButton(
            onPressed: () async {
              await ShowService.alert<TransactionGRpcModel?>(
                  content: SearchId(
                onPressed: read.getStatus,
              )).then((value) {
                if (value == null) return;
                ShowService.alert(content: AlerInfo(transacion: value));
              });
            },
            child: const Text('Get Transaction')),
      ],
    );
  }
}
