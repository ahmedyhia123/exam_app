import 'package:dio/dio.dart';
import 'package:exam_app/features/auth/api/apiservices/api_servises.dart';
import 'package:exam_app/core/DI/di.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  PrettyDioLogger providePrettyDioLogger() => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      );

  @singleton
  Dio provideDio(PrettyDioLogger logger) {
    Dio dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    dio.interceptors.add(logger); // استخدم parameter بدل getIt
    return dio;
  }

  @singleton
  ApiServises provideApiServises(Dio dio) => ApiServises(dio);
}
