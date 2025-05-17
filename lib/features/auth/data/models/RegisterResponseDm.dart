
import '../../domain/entities/RegisterResponseEntity.dart';

/// message : "User registered successfully"

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({
      super.message,
      super.statusMessage,});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMessage = json['statusMessage'];
  }


}