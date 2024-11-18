import 'package:client_basev2/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';
import 'package:server_grpc/server_grpc.dart';

import '../../../infraestructure/utils/utils.dart';

class AlertListTransaction extends StatelessWidget {
  final Function(TransactionGRpcModel) cancel;
  final Function(String) startTransac;
  final Function(String) search;

  final List<TransactionGRpcModel> transacions;

  const AlertListTransaction(
      {Key? key,
      required this.transacions,
      required this.cancel,
      required this.startTransac,
      required this.search})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    // final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      content: SizedBox(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(transacions.length, (index) {
              final transacion = transacions.reversed.toList()[index];
              return Banner(
                location: BannerLocation.topEnd,
                color: transacion.status!.value == 4
                    ? Colors.green
                    : transacion.status!.value == 0
                        ? Colors.blue
                        : Colors.red,
                message:
                    transacion.status != null ? transacion.status!.name : '',
                child: Stack(
                  children: [
                    SizedBox(
                      width: size.width * 0.7,
                      child: Card(
                          shadowColor: Colors.black,
                          elevation: 2,
                          color: const Color.fromARGB(255, 250, 246, 246),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                ColumnInfo(
                                  title: 'Id',
                                  info: transacion.idProtoTransaction ?? '',
                                ),
                                ColumnInfo(
                                  title: 'Tipo',
                                  info: transacion.type!.name,
                                ),
                                ColumnInfo(
                                  title: 'Monto total',
                                  info: UtilsAmont.amotTotal(transacion.amount,
                                      transacion.secondaryAmount),
                                ),
                                ColumnInfo(
                                  title: 'Estado',
                                  info: transacion.status != null
                                      ? transacion.status!.name
                                      : '',
                                  infoStyle: styleText.titleMedium!.copyWith(
                                      color: transacion.status!.value == 4
                                          ? Colors.green
                                          : transacion.status!.value == 0
                                              ? Colors.blue
                                              : Colors.red),
                                ),
                                if (transacion.stan != null)
                                  ColumnInfo(
                                    title: 'Stan',
                                    info: transacion.stan ?? '',
                                  ),
                                if (transacion.idProtoTransaction != null)
                                  ElevatedButton(
                                      onPressed: () async {
                                        NavService.pop();
                                        startTransac(
                                            transacion.idProtoTransaction!);
                                      },
                                      child: const Text('Iniciar cobro')),
                                if (transacion.stan != null &&
                                    transacion.status!.value == 4)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          NavService.pop();
                                          cancel(transacion);
                                        },
                                        child: const Text('Cancelar')),
                                  )
                              ],
                            ),
                          )),
                    ),
                    if (transacion.idProtoTransaction != null)
                      Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                              onPressed: () {
                                NavService.pop();
                                search(transacion.idProtoTransaction ?? "");
                              },
                              icon: const Icon(Icons.info_outline_rounded))),
                  ],
                ),
              );
            })
          ],
        ),
      )),
      actions: [
        ElevatedButton(
            onPressed: () {
              NavService.pop();
            },
            child: const Text('Ok'))
      ],
    );
  }
}
