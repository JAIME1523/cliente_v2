import 'package:client_basev2/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../widgets/widgets.dart';

class PregressTransaction extends StatelessWidget {
  const PregressTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<TransactionsBloc>();
    final watch = context.watch<TransactionsBloc>();


    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset('assets/json/progress_bar 2.json'),
        ),
        const Text('Procesando'),
          if (watch.state.showButton)
        PrimaryButton(
          title: 'Cancelar Proceso',
          ischarge: true,
          onPressed: !watch.state.activeButon ?  () async {
            read.add(CancelProggressTransaction());
          }: null,
        )
      ],
    );
  }
}
