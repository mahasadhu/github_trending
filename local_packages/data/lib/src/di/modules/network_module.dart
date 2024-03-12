import 'package:data/src/network/http_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {

  @lazySingleton
  Dio get dio => HttpClient.initDio();

}