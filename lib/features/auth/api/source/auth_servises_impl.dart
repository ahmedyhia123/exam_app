import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/DI/di.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/auth/api/model/SignInRespones.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/api/apiservices/api_servises.dart';
import 'package:exam_app/features/auth/api/model/user.dart';
import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthApiService)
class AuthApiServiceImpl implements AuthApiService {
  
  @override
  Future<Either<Failure, UserEntity>> signIn(SigninReqParams params) async {
    try {
      var res = await getIt<ApiServises>().signIn(params.toMap());
      return Right(UserEntity.fromUserDto( res.user!));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }
}
