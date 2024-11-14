import '../../models/data_model.dart';
import '../services/db_services.dart';

abstract class DbTableRepo {
  Future<int> insert(NameTable table, DataDbM dataModel);
  Future<int> update(NameTable table,{required DataDbM data,SearchBy type = SearchBy.idProto,required String value});
  Future<int> delete(NameTable table, int id);
  Future<List<Map<String,dynamic>>> getAll(NameTable table);
  Future<List<Map<String,dynamic>>> getBy(NameTable table,{required SearchBy type,required String value});
 Future<List<Map<String,dynamic>>> customQuery(String query);
  Future<List<Map<String,dynamic>>> getByIdOrigin({required String origin, required String idTransaccion});
  Future<bool>cleanTable(NameTable table);
}

enum NameTable {
  transaccion("Transactions"),
  origintransaction("Origintransaction"),
  resultTransaction("ResultTransaction"),
  waitingTransaction('WaitingTransaction'),
  additionalInformation("AdditionalInformation");

  final String value;
  const NameTable(this.value);
}
