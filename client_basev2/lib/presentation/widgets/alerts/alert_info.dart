import 'package:client_basev2/infraestructure/utils/utils.dart';
import 'package:client_basev2/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';
import 'package:server_grpc/database/database.dart';

class AlerInfo extends StatelessWidget {
  const AlerInfo({super.key, required this.transacion});
  final TransactionGRpcModel transacion;
  @override
  Widget build(BuildContext context) {
    final addInfo = transacion.additionalInformation;
    final styleText = Theme.of(context).textTheme;
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColumnInfo(
              title: 'Id',
              info: transacion.idProtoTransaction ?? '',
            ),
            ColumnInfo(
              title: 'Monto',
              info: UtilsAmont.amontCustom(transacion.amount),
            ),
            ColumnInfo(
              title: 'Propina',
              info: transacion.secondaryAmount != null
                  ? (transacion.secondaryAmount.toString())
                  : null,
            ),
            ColumnInfo(
              title: 'Estatus',
              infoStyle: styleText.titleMedium!.copyWith(
                  color: transacion.status!.value == 4
                      ? Colors.green
                      : transacion.status!.value == 0
                          ? Colors.blue
                          : Colors.red),
              info: transacion.status != null ? transacion.status!.name : '',
            ),
            ColumnInfo(
              title: 'Type',
              info: transacion.type?.name,
            ),
            ColumnInfo(
              title: 'arqc',
              info: transacion.arqc,
            ),
            ColumnInfo(
              title: 'N. Autorización ',
              info: transacion.authorizationNumber,
            ),
            ColumnInfo(
              title: 'PAN',
              info: transacion.maskPan,
            ),
            ColumnInfo(
              title: 'N. Referencia',
              info: transacion.referenceNumber,
            ),
            if (addInfo != null)
              _ColunInfo(
                addintinal: addInfo,
              )
          ],
        ),
      ),
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

class _ColunInfo extends StatelessWidget {
  const _ColunInfo({
    required this.addintinal,
  });
  final AdditionalInformationModel addintinal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...addintinal.toMapModel().entries.map(
              (e) => ColumnInfo(
                title: e.key.toUpperCase(),
                info: e.value.toString(),
              ),
            ),
      ],
    );
  }
}
