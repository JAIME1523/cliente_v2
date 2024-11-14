
import 'package:server_grpc/database/db/services/db_services.dart';
import 'package:server_grpc/database/models/additional_information_model.dart';

import '../data/db_implement.dart';
import '../data/db_table_repo.dart';

class AdditionalDbService {
  static final _impl = DbImplement();
  static const _table = NameTable.additionalInformation;

  static Future<int> insert(AdditionalInformationModel data) async => await _impl.insert(_table, data);

  static Future<AdditionalInformationModel?> getAditional(String id) async {
    final resp = await _impl.getBy(_table, type: SearchBy.idDetail, value: id);
    if (resp.isEmpty) return null;
    return AdditionalInformationModel.fromMap(resp[0]);
  }

  static Future<AdditionalInformationModel?> getByTransactionAditional(String id) async {
    final resp = await _impl.getBy(_table, type: SearchBy.idProto, value: id);
    if (resp.isEmpty) return null;
    return AdditionalInformationModel.fromMap(resp[0]);
  }
  static Future cleanAditional() async => _impl.cleanTable(_table);
}
