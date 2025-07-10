import 'package:dio/dio.dart';
import 'package:exam_app/features/auth/api/model/SignInRespones.dart';
import 'package:retrofit/retrofit.dart';

part 'api_servises.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/v1')
abstract class ApiServises {
  factory ApiServises(Dio dio, {String? baseUrl}) = _ApiServises;

  @POST('/auth/signin')
  Future<SigninRespones> signIn(@Body() Map<String, dynamic> body);
}
