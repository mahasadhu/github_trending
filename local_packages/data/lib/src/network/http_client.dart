import 'package:dio/dio.dart';

class HttpClient {
  static Dio initDio() {
    final dio = Dio();

    dio.options.baseUrl = "https://api.github.com";
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) {
          options.headers.addAll(
            {
              "Authorization":
                  "Bearer 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",
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
