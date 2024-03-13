import 'package:dio/dio.dart';
import '../env/env_manager.dart';

class HttpClient {
  static Dio initDio(EnvManager envManager) {
    final dio = Dio();

    dio.options.baseUrl = envManager.getBaseUrl();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) {
          options.headers.addAll(
            {
              "Authorization":
                  "Bearer ${envManager.getGithubApiKey()}",
              "X-GitHub-Api-Version": "2022-11-28"
            },
          );
          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}
