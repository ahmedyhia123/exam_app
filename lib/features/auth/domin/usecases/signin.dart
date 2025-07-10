import 'package:dartz/dartz.dart';
import 'package:exam_app/core/DI/di.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/core/usecases/usecases.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
@singleton
class SigninUsecase implements UseCase<Either ,SigninReqParams> {
  @override
  Future<Either<Failure, UserEntity>> call({SigninReqParams ? params}) async {
    return await getIt<AuthRepoImpl>().signIn(params!);
  }
}

