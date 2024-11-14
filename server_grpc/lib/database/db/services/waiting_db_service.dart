
import 'package:server_grpc/database/db/data/db_implement.dart';
import 'package:server_grpc/database/db/data/db_table_repo.dart';
import 'package:server_grpc/database/models/waiting_transaction_mdoel.dart';

class WaitingDbService {
  static final _impl = DbImplement();
  static const _table = NameTable.waitingTransaction;

  static Future<int> insert(WaitingTransactionModel data) async => await _impl.insert(_table, data);

  static Future<WaitingTransactionModel?> getLast() async{
    final resp =   await _impl.getAll(_table);
    if(resp.isEmpty) return null;
    return WaitingTransactionModel.fromMap(resp.last);
  }
  static Future cleanWaiting ()async=> _impl.cleanTable(_table);



}