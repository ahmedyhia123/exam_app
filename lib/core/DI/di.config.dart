// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/api/apiservices/api_servises.dart' as _i461;
import '../../features/auth/api/source/auth_servises_impl.dart' as _i247;
import '../../features/auth/data/repository/auth_repo_impl.dart' as _i751;
import '../../features/auth/data/source/auth_api_service.dart' as _i984;
import '../../features/auth/domin/usecases/signin.dart' as _i232;
import '../../features/auth/presentation/view_model/cubit/signin_cubit.dart'
    as _i287;
import '../provider/app_config_provider.dart' as _i291;
import 'modules/dio_module.dart' as _i983;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.providesharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i528.PrettyDioLogger>()),
    );
    gh.singleton<_i461.ApiServises>(
      () => dioModule.provideApiServises(gh<_i361.Dio>()),
    );
    gh.factory<_i984.AuthApiService>(
      () => _i247.AuthApiServiceImpl(gh<_i461.ApiServises>()),
    );
    gh.singleton<_i291.AppConfigProvider>(
      () => _i291.AppConfigProvider(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i751.AuthRepoImpl>(
      () => _i751.AuthRepoImpl(gh<_i984.AuthApiService>()),
    );
    gh.factory<_i232.SigninUsecase>(
      () => _i232.SigninUsecase(gh<_i751.AuthRepoImpl>()),
    );
    gh.factory<_i287.SigninCubit>(
      () => _i287.SigninCubit(gh<_i232.SigninUsecase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
