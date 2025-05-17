import 'package:dartz/dartz.dart';
import 'package:pharma_now/features/auth/data/models/RegisterResponseDm.dart';

import '../../../../../core/errors/failures.dart';
import '../../entities/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures, RegisterResponseDm>> createUserWithEmailAndPassword(
      String email, String password, String name);

}