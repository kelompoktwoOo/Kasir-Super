import 'package:firebase_remote_config/firebase_remote_config.dart';

class ConfigData {
  ConfigData._();

  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    try {
      await remoteConfig.setDefaults(const {
        'appName': 'Kasir Super',
        'privacyPolicy': 'https://github.com/kelompoktwoOo/Kasir-Super/security/policy',
        'version': '1.0.0-beta',
        'uxCamKey': 'YOUR_UX_CAM',
        'appStoreUrl': 'https://github.com/kelompoktwoOo/Kasir-Super',
        'xenditKey': 'YOUR_XENDIT_KEY',
      });
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 30),
        minimumFetchInterval: const Duration(minutes: 1),
      ));

      await remoteConfig.fetchAndActivate();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static String getValue(String key) {
    return remoteConfig.getValue(key).asString();
  }
}
