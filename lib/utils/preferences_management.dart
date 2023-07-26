import 'package:get_storage/get_storage.dart';

enum PMKeys {
  isDarkTheme,
}

class PreferencesManagement {
  static final _storage = GetStorage();

  static String? read(PMKeys key) {
    return _storage.read(key.toString());
  }

  static saveBool({required PMKeys key, bool value = false}) {
    _storage.write(key.toString(), value);
  }

  static bool getBool({required PMKeys key}) {
    var value = _storage.read(key.toString());
    if (value is bool) {
      return value;
    }
    return false;
  }

  static remove(PMKeys key) {
    _storage.remove(key.toString());
  }

  static clear() {
    _storage.erase();
  }
}
