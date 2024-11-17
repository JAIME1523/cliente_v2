import 'package:client_basev2/infraestructure/infraestructure.dart';
import 'package:client_basev2/infraestructure/services/encrypt_grcp/encrrypt_grcp_service.dart';
import 'package:client_basev2/infraestructure/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_service/snack/snack_service.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'views_state.dart';

class ViewsCubit extends Cubit<ViewsState> {
  ViewsCubit() : super(ViewsState());
  TextEditingController ipgController = TextEditingController();
  TextEditingController porgController = TextEditingController();
  final dataSour = TransactionsRepositoryImpl(TransactionGrpcDatasource());
  validateMact() async {
    emit(state.copyWith(isLoading: true));
    final mac = await SecureStor.readStorage(SecureList.macKey);
    emit(state.copyWith(
        isLoading: false,
        isMatch: mac != null,
        pageView: mac == null ? EnumViews.match : EnumViews.transaction));
  }

  Future cleanMatch() async {
    await SecureStor.storage.deleteAll();
    validateMact();
  }

  cleanFrom() {
    ipgController.clear();
    porgController.clear();
    emit(state.copyWith(isCanSave: false, isEditing: false));
  }
editINfo(){
    emit(state.copyWith( isEditing: true));

}
  saveInfo() async {
    await LocalStorage.setInt(
        PreferencesInt.port, int.tryParse(porgController.text) ?? 8080);
    await LocalStorage.setString(
        PreferencesString.ipAddres, ipgController.text);
  }

  startMacth(String ramdonCode) async {
    final publicKey = await EncryptGrcpService.generatePem();
    final match = await dataSour.registerClient(
        publicKey: publicKey, randomCode: ramdonCode);
    if (match.isLeft()) {
      SnackService.showSnackbarError(match.asLefth().errorMesage);
      return;
    }
    await EncryptGrcpService.decripMacSave(match.asRight());
    await EncryptGrcpService.getMac();
    SnackService.showSnackbar("Se vincularon dispositivos");
    validateMact();
  }

  validateForm() {
    final isCan = (ipgController.text != LocalStorage.getIpAdrres() ||
        porgController.text != LocalStorage.getPort().toString());
    emit(state.copyWith(isCanSave: isCan));
  }
}
