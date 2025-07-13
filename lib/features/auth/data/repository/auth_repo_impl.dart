import 'package:dartz/dartz.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AuthRepoImpl implements AuthRepo {
  AuthApiService _authApiService ;
  AuthRepoImpl(this._authApiService);
  @override
  Future<Either<Failure, UserEntity>> signIn(SigninReqParams params) async {
    return await _authApiService.signIn(params);
  }
}
