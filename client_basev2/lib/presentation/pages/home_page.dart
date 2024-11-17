import 'package:client_basev2/presentation/bloc/provider.dart';
import 'package:client_basev2/presentation/views/drawer_view.dart';
import 'package:flutter/material.dart';

import '../views/views.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screnProvider = context.watch<ViewsCubit>().state;
    return Scaffold(
       onEndDrawerChanged: (isOpened) {
         context.read<ViewsCubit>().cleanFrom();
      },
      endDrawer: const DrawerView(),
       appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Center(child: SingleChildScrollView(child: view(screnProvider.pageView))),
      )
    );
  }

  Widget view(EnumViews view) {
    return switch (view) {
      EnumViews.transaction => const TransactionsView(),
      EnumViews.match =>  const MatchView(),
    };
  }
}
