import 'dart:math';
import 'package:client_basev2/presentation/bloc/views_cubit/views_cubit.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';
import '../../config/routers/svg_router.dart';
import '../widgets/widgets.dart';

class MatchView extends StatelessWidget {
  const MatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final styleText = Theme.of(context).textTheme;
    return SizedBox(
      height: size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowSvg(height: size.height * 0.4, path: SvgRouter.warning),
            const SizedBox(height: 20),
            const Text(
              'Inicie el servicio de emparejamiento desde su terminal para poder realizar conexión',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
                maxWidth: size.width * 0.5,
                ischarge: true,
                onPressed: () async {
                  int randomNumber = Random().nextInt(90000) + 10000;
                  ShowService.alert(
                      content: _AlertCode(
                          styleText: styleText, randomNumber: randomNumber));
                  await context
                      .read<ViewsCubit>()
                      .startMacth(randomNumber.toString());
                  // ignore: use_build_context_synchronously
                  if (Navigator.canPop(context)) NavService.pop();
                  
                },
                title: 'Emparejar'),
          ],
        ),
      ),
    );
  }
}

class _AlertCode extends StatelessWidget {
  const _AlertCode({
    required this.styleText,
    required this.randomNumber,
  });

  final TextTheme styleText;
  final int randomNumber;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Ingrese este numero en su terminal',
          style: styleText.titleMedium,
        ),
      ),
      content: Text(
        randomNumber.toString(),
        style: styleText.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
