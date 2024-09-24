abstract class HiveService {
  Future<void> insert<T>(String key, T entity, String nameBox);
  Future<List<T>> loadAll<T>(String nameBox);
}
