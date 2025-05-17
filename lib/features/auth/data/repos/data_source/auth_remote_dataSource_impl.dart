import 'package:dartz/dartz.dart';
import 'package:pharma_now/core/api/api_manager.dart';
import 'package:pharma_now/core/api/end_point.dart';

import 'package:pharma_now/core/errors/failures.dart';
import 'package:pharma_now/features/auth/data/models/RegisterResponseDm.dart';

import 'package:pharma_now/features/auth/domain/entities/RegisterResponseEntity.dart';
import 'package:pharma_now/features/auth/domain/repo/auth_repo.dart';

import '../../../domain/repo/datasource/auth_remote_dataSource.dart';
import '../auth_repo_impl.dart';

class AuthRemoteDataSourceIMPL extends AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceIMPL({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseDm>>
  createUserWithEmailAndPassword(String email, String password, String name)async {
  var response=await apiManager.postData(endPoint: EndPoint.singUp,
   body: {
     "username": email,
     "password": password,
     "fullname":name,
    },

   );
 var registerResponse= RegisterResponseDm.fromJson(response.data);
 if(response.statusCode! >=200 && response.statusCode! <300 ){
   return Right(registerResponse );
 }else{
   return Left(ServerFailure(message: "ServerError"));
 }
  }


}