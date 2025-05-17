import 'package:dartz/dartz.dart';
import 'package:pharma_now/core/errors/failures.dart';
import '../entities/RegisterResponseEntity.dart';

abstract class AuthRepo {
  Future<Either<Failures, RegisterResponseEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
}
