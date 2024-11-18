import 'package:client_basev2/infraestructure/utils/uitls_amont.dart';
import 'package:client_basev2/presentation/bloc/alert_cubit/alert_insert_cubit.dart';
import 'package:client_basev2/presentation/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_service/nav_service.dart';
import 'package:server_grpc/grpc_data/protos/model/transactions/transactions.pbenum.dart';

class AlertInser extends StatelessWidget {
  const AlertInser({super.key, this.onPressed,  this.showType = false});
  final Function(int, TransactionType)? onPressed;
  final bool showType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertInsertCubit(),
      child: Builder(builder: (context) {
        final read = context.read<AlertInsertCubit>();
        final watch = context.watch<AlertInsertCubit>().state;

        return AlertDialog(
          title: const Center(child: Text('Ingresa el monto')),
          content: Form(
            key: read.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                if(showType)  ExpansionTile(
                    controller: read.controller,
                    subtitle: Text(watch.transactionTypeSelect.name),
                    title: const Text('Tipo transaccion'),
                    children: [
                      ...List.generate(
                          TransactionType.values.length,
                          (index) => RadioListTile(
                              title: Text(TransactionType.valueOf(index)!.name),
                              value: TransactionType.valueOf(index),
                              groupValue: watch.transactionTypeSelect,
                              onChanged: (value) {
                                read.selectType(value!);
                              }))
                    ],
                  ),
                  CustomInputField(
                    inputFormatters: [],
                    validator: (value) => UtilsAmont.validtesAmont(value ?? ""),
                    controller: read.amountControl,
                    onChange: (value) {
                      read.validate();
                    },
            keyboardType: TextInputType.number,
                    onSubmitted: (va) {
                      if (read.amountControl.text.isEmpty) {
                        NavService.pop();
                        return;
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
                      onPressed!(UtilsAmont.amont(read.amountControl.text),
                          watch.transactionTypeSelect);
                      if (context.mounted) {
                        if (Navigator.canPop(context)) {
                          NavService.pop();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Container(
              constraints: const BoxConstraints(maxWidth: 100, maxHeight: 45),
              child: FilledButton(
                  onPressed: (!watch.canPress || onPressed == null)
                      ? null
                      : () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          onPressed!(UtilsAmont.amont(read.amountControl.text),
                              watch.transactionTypeSelect);
                          if (context.mounted) {
                            if (Navigator.canPop(context)) {
                              NavService.pop();
                            }
                          }
                        },
                  child: const Text('Aceptar')),
            )
          ],
        );
      }),
    );
  }
}
