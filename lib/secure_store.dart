import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  final secureStore = const FlutterSecureStorage();
  final String _key_users = "master_key_users";
  final String _key_theme = "master_key_theme";

  Future<void> setUserSecureStore(String data) async {
    await secureStore.write(key: _key_users, value: data);
  }

  Future<String?> getUserSecureStore() async {
    return await secureStore.read(key: _key_users);
  }

  Future<void> setThemeSecureStore(String data) async {
    await secureStore.write(key: _key_theme, value: data);
  }

  Future<String?> getThemeSecureStore() async {
    return await secureStore.read(key: _key_theme);
  }

  Future<void> deleteUser() async {
    await secureStore.delete(key: _key_users);
  }
}
