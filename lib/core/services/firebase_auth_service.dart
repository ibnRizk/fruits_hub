import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'exception in firebaseAuthservice create user with email and password: ${e.toString()}.',
      );
      if (e.code == 'weak-password') {
        throw CustomException(
          message: 'الرقم السري ضعيف جداً.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message:
              'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message:
              'لا يوجد اتصال بالانترنت. الرجاء التحقق من الاتصال و المحاولة مرة اخرى.',
        );
      } else {
        throw CustomException(
          message:
              'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        'exception in create user with email and password: ${e.toString()}.',
      );
      throw CustomException(
        message:
            'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }
}
