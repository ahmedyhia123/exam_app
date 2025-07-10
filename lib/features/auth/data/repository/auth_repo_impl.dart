import 'package:dartz/dartz.dart';
import 'package:exam_app/core/DI/di.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/api/model/user.dart';
import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> signIn(SigninReqParams params) async {
    return await getIt<AuthApiService>().signIn(params);
  }
}
