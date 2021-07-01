import 'package:flutter/cupertino.dart';

class AppConfig {
  AppConfig({
    required this.baseURL,
    this.somethingKey,
  });

  final String baseURL;
  final String? somethingKey;

  factory AppConfig.fromDEV() => AppConfig(
        baseURL: '',
        somethingKey: '',
      );

  factory AppConfig.fromSTG() => AppConfig(
        baseURL: '',
        somethingKey: '',
      );

  factory AppConfig.fromPRD() => AppConfig(
        baseURL: '',
        somethingKey: '',
      );
}
