import 'package:dartz/dartz.dart';
import 'package:pharma_now/core/errors/exceptions.dart';
import 'package:pharma_now/core/errors/failures.dart';
import 'package:pharma_now/features/auth/data/models/user_model.dart';
import 'package:pharma_now/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entities/RegisterResponseEntity.dart';

class AuthRepoImpl extends AuthRepo {
AuthRepo authRepo;
  AuthRepoImpl({required this.authRepo});

  @override
  Future<Either<Failures, RegisterResponseEntity>>
  createUserWithEmailAndPassword(String email, String password, String name)async {
    var either= await authRepo.createUserWithEmailAndPassword(email, password, name);
    return   either.fold((error)=>Left(error), (response)=>Right(response));
  }
}
