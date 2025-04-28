import 'package:dartz/dartz.dart';
import 'package:pharma_now/core/errors/failures.dart';
import 'package:pharma_now/features/auth/domain/repo/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
}
