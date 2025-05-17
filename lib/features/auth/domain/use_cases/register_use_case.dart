import 'package:dartz/dartz.dart';
import 'package:pharma_now/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failures.dart';
import '../entities/RegisterResponseEntity.dart';

class RegisterUseCase{
  AuthRepo authRepo;
  RegisterUseCase({required this.authRepo});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String email,String password,String name,){
  return  authRepo.createUserWithEmailAndPassword(email, password, name);

  }
}