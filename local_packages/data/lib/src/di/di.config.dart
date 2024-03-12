// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repositories/github_trending_repository.dart' as _i4;
import '../repositories/github_trending_repository_impl.dart' as _i5;
import 'modules/network_module.dart' as _i6;

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
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Dio>(() => networkModule.dio);
  gh.lazySingleton<_i4.GithubTrendingRepository>(
      () => _i5.GithubTrendingRepositoryImpl(gh<_i3.Dio>()));
  return getIt;
}

class _$NetworkModule extends _i6.NetworkModule {}
