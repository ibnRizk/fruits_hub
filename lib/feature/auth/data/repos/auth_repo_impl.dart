import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/feature/auth/data/models/user_model.dart';
import 'package:fruits_hub/feature/auth/domin/entites/user_entity.dart';
import 'package:fruits_hub/feature/auth/domin/repo/auth_repo.dart';

import '../../../../core/errors/exceptions.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>>
  createuserwithemailandpassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'exception in auth repo create user with email and password: ${e.toString()}.',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }
}
