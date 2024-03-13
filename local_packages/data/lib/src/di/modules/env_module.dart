import 'package:data/src/env/env_manager.dart';
import 'package:data/src/network/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class EnvModule {

  @singleton
  Future<DotEnv> dotEnv() async {
    await dotenv.load(fileName: "packages/data/assets/.env");
    return dotenv;
  }
}