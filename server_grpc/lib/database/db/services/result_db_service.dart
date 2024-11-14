import 'package:server_grpc/database/db/data/db_implement.dart';
import 'package:server_grpc/database/db/data/db_table_repo.dart';
import 'package:server_grpc/database/db/services/db_services.dart';
import 'package:server_grpc/database/models/result_model.dart';

class ResultDbService {
  static final _impl = DbImplement();
  static const _table = NameTable.resultTransaction;

  static Future<int> insert(ResultTransaction data) async => await _impl.insert(_table, data);

  static Future<ResultTransaction> getRseult(String id) async {
    final resp = await _impl.getBy(_table, type: SearchBy.idProto, value: id);
    if (resp.isEmpty) return ResultTransaction(idProto: '', dataResult: '');
    return ResultTransaction.fromMap(resp[0]);
  }

  static Future cleanResult() async => _impl.cleanTable(_table);
}
