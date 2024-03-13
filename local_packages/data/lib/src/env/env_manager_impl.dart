import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'env_manager.dart';

@Singleton(as: EnvManager)
class EnvManagerImpl extends EnvManager {

  final String _keyApiKey = "API_KEY";
  final String _keyBaseUrl = "BASE_URL";

  final DotEnv _dotEnv;

  EnvManagerImpl(this._dotEnv);

  @override
  String getBaseUrl() {
    return _dotEnv.get(_keyBaseUrl);
  }

  @override
  String getGithubApiKey() {
    return _dotEnv.get(_keyApiKey);
  }

}