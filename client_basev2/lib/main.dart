import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

import 'package:client_basev2/config/theme/app_theme.dart';
import 'package:client_basev2/infraestructure/infraestructure.dart';
import 'package:client_basev2/presentation/bloc/provider.dart';
import 'package:client_basev2/presentation/pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create:  (_) => ViewsCubit()..validateMact(),),
      BlocProvider(create:  (_) => TransactionsBloc()),
    ],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackService.messagerKey,
      navigatorKey: NavService.navigatorKey,
      home: const HomePage()
    );
  }
}
