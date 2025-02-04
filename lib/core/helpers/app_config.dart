import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppConfig {
  String? baseURL = "https://dkndmolrswy7b.cloudfront.net";
  String? currentEnv;

  AppConfig._();
  AppConfig({this.baseURL, this.currentEnv});

  static AppConfig? _appConfig;

  static AppConfig get instance {
    return _appConfig ?? AppConfig._();
  }

  String baseApiUrl() {
    return baseURL!;
  }

  static Future<AppConfig> forEnvironment(String env) async {
    if (kDebugMode) {
      print('Environment=$env');
    }
    final contents = await rootBundle.loadString(
      'assets/env/$env.json',
    );
    final json = jsonDecode(contents);
    _appConfig = AppConfig(baseURL: json['baseURL'], currentEnv: env);
    return _appConfig!;
  }
}
