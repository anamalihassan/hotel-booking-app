import 'dart:convert';
import 'dart:developer' as d;

import 'package:flutter/foundation.dart';

class LogUtils {
  static void logWith(String prefix, dynamic message) {
    if (kDebugMode) {
      d.log(prefix + const JsonEncoder.withIndent('  ').convert(message));
    }
  }

  static void log(dynamic message) {
    if (kDebugMode) {
      d.log(const JsonEncoder.withIndent('  ').convert(message));
    }
  }

  static void printLog(dynamic message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
