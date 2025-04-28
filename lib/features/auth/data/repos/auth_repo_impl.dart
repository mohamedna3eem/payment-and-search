import 'package:dartz/dartz.dart';
import 'package:pharma_now/core/errors/exceptions.dart';
import 'package:pharma_now/core/errors/failures.dart';
import 'package:pharma_now/features/auth/data/models/user_model.dart';
import 'package:pharma_now/features/auth/domain/repo/auth_repo.dart';
import 'package:pharma_now/features/auth/domain/repo/entities/user_entity.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../entities/RegisterResponseEntity.dart';
import 'entities/RegisterResponseEntity.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failures, RegisterResponseEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
