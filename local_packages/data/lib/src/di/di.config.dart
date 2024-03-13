// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_dotenv/flutter_dotenv.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../env/env_manager.dart' as _i4;
import '../env/env_manager_impl.dart' as _i5;
import '../repositories/github_trending_repository.dart' as _i7;
import '../repositories/github_trending_repository_impl.dart' as _i8;
import 'modules/env_module.dart' as _i9;
import 'modules/network_module.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final envModule = _$EnvModule();
  final networkModule = _$NetworkModule();
  gh.singletonAsync<_i3.DotEnv>(() => envModule.dotEnv());
  gh.singletonAsync<_i4.EnvManager>(
      () async => _i5.EnvManagerImpl(await gh.getAsync<_i3.DotEnv>()));
  gh.singletonAsync<_i6.Dio>(
      () async => networkModule.dio(await gh.getAsync<_i4.EnvManager>()));
  gh.singletonAsync<_i7.GithubTrendingRepository>(() async =>
      _i8.GithubTrendingRepositoryImpl(await gh.getAsync<_i6.Dio>()));
  return getIt;
}

class _$EnvModule extends _i9.EnvModule {}

class _$NetworkModule extends _i10.NetworkModule {}
