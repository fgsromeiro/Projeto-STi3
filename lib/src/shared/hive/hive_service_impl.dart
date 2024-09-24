import 'package:hive/hive.dart';
import 'package:projeto_sti3/src/shared/domain/exceptions.dart';
import 'package:projeto_sti3/src/shared/interface/hive_service.dart';

class HiveServiceImpl implements HiveService {
  @override
  Future<void> insert<T>(String key, T entity, String nameBox) async {
    try {
      var box = await Hive.openBox<T>(nameBox);

      await box.put(key, entity);

      box.close();
    } catch (e) {
      throw LocalDatabaseException('Houve um erro ao inserir o dado');
    }
  }

  @override
  Future<List<T>> loadAll<T>(String nameBox) async {
    List<T> listReturn = [];

    try {
      var box = await Hive.openBox<T>(nameBox);

      for (var element in box.values) {
        listReturn.add(element);
      }

      box.close();

      return listReturn;
    } catch (e) {
      throw LocalDatabaseException('Houve um erro ao carregar os dados');
    }
  }
}
