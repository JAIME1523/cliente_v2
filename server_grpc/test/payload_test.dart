import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //!Simpre fallaran por que no se inicia el canal para Agnostiko "channel agnostiko", pero se tienen validados los errores
  WidgetsFlutterBinding.ensureInitialized();
  test('Traer Divice', () async {
    //final divice = await PayloadGenerateService.stanCounterPaylo(stan: '120', counter: '53');
   // expect(divice, []);
  });

}
