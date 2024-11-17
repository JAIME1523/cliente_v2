import 'package:client_basev2/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

class SearchId extends StatefulWidget {
  const SearchId({super.key, this.onPressed});
  final Function(String)? onPressed;

  @override
  State<SearchId> createState() => _SearchIdState();
}

class _SearchIdState extends State<SearchId> {
  TextEditingController idTr = TextEditingController();
  bool canPress = false;
  bool _isLoading = false;
  bool _dispose = true;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    if (_dispose == true) setState(() {});
  }

  @override
  void dispose() {
    _dispose = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Ingresa ID')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomInputField(
            controller: idTr,
            onChange: (value) {
              if (idTr.text.isEmpty) {
                canPress = false;
              } else {
                canPress = true;
              }
              setState(() {});
            },
          ),
        ],
      ),
      actions: [
        Container(
          constraints: const BoxConstraints(maxWidth: 100, maxHeight: 45),
          child: FilledButton(
              onPressed: (isLoading || !canPress || widget.onPressed == null)
                  ? null
                  : () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      isLoading = true;
                      final resul = await widget.onPressed!(idTr.text);
                      isLoading = false;
                      if (context.mounted) {
                        if (Navigator.canPop(context)) {
                          NavService.pop(result: resul);
                        }
                      }
                    },
              child: isLoading
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : const Text('Aceptar')),
        )
      ],
    );
  }
}
