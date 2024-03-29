import 'package:data/src/env/env_manager.dart';
import 'package:data/src/network/http_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {

  @singleton
  Dio dio(EnvManager envManager) => HttpClient.initDio(envManager);

}