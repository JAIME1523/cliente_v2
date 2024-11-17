import 'package:client_basev2/infraestructure/utils/utils.dart';
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
          final size = MediaQuery.sizeOf(context);
    return   AlertDialog(
            content: SizedBox(
              height: transacion.arqc != null
                  ? size.height * 0.70
                  : size.height * 0.25,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _ColumnInfo(
                      title: 'Id',
                      info: transacion.idProtoTransaction ?? '',
                    ),
                    _ColumnInfo(
                      title: 'Monto',
                      info:
                          UtilsAmont.amontCustom(transacion.amount),
                    ),
                    _ColumnInfo(
                      title: 'Propina',
                      info: transacion.secondaryAmount != null
                          ? (transacion.secondaryAmount.toString())
                          : null,
                    ),
                    _ColumnInfo(
                      title: 'Estatus',
                      infoStyle: styleText.titleMedium!.copyWith(
                          color: transacion.status!.value == 4
                              ? Colors.green
                              : transacion.status!.value == 0
                                  ? Colors.blue
                                  : Colors.red),
                      info: transacion.status != null
                          ? transacion.status!.name
                          : '',
                    ),
                    _ColumnInfo(
                      title: 'Type',
                      info: transacion.type!.name,
                    ),
                    _ColumnInfo(
                      title: 'arqc',
                      info: transacion.arqc,
                    ),
                    _ColumnInfo(
                      title: 'N. Autorización ',
                      info: transacion.authorizationNumber,
                    ),
                    _ColumnInfo(
                      title: 'PAN',
                      info: transacion.maskPan,
                    ),
                    _ColumnInfo(
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
        _ColumnInfo(
          title: 'EntryMode',
          info: addintinal.entryMode!.name,
        ),
        _ColumnInfo(
          title: 'CardBrand',
          info: addintinal.cardBrand,
        ),
        _ColumnInfo(
          title: 'Date',
          info: addintinal.transactionDate,
        ),
        _ColumnInfo(
          title: 'onlineRequested',
          info: addintinal.onlineRequested.toString(),
        ),
        _ColumnInfo(
          title: 'cvmType',
          info: addintinal.cvmType.toString(),
        ),
      ],
    );
  }
}

class _ColumnInfo extends StatelessWidget {
  const _ColumnInfo({required this.title, required this.info, this.infoStyle});
  final String title;
  final String? info;
  final TextStyle? infoStyle;
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return info == null
        ? const SizedBox()
        : Column(
            children: [
              Text(
                title,
                style: styleText.bodySmall,
              ),
              SelectableText(
                info!,
                style: infoStyle ?? styleText.titleMedium,
              ),
              const SizedBox(height: 20),
            ],
          );
  }
}
