import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/core/usecases/use_cases.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/entity/login_entity/auth_response_entity.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthUseCase implements UseCase<AuthResponseEntity, AuthEntity> {
  final AuthRepository authRepository;

  const AuthUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, AuthResponseEntity>> call(AuthEntity params) async {
    return await authRepository.performAuth(
      phoneNumber: params.phoneNo,
    );
  }
}
