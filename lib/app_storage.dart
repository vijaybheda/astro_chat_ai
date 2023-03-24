import 'package:get_storage/get_storage.dart';

class AppStorage {
  // ignore: prefer_function_declarations_over_variables
  final storageBox = () => GetStorage(StorageKey.kAppStorageKey);

  Future<void> appLogout() async {
    await storageBox().remove(StorageKey.kLoggedInUser);

    return;
  }

  dynamic read(String key) {
    return storageBox().read(key);
  }

  Future<void> write(String key, var value) async {
    return await storageBox().write(key, value);
  }

  bool getBool(String key) {
    return read(key);
  }

  Future<void> setBool(String key, bool value) async {
    await write(key, value);
    return;
  }

  Future<void> setInt(String key, int value) async {
    await write(key, value);
    return;
  }

  Future<void> initStorage() async {
    await GetStorage.init(StorageKey.kAppStorageKey);
  }
}

class StorageKey {
  static const String kAppStorageKey = 'AppStorageKey';
  static const String kLoggedInUser = 'LoggedInUser';
  static const String kAppLanguage = 'appLanguage';
}
