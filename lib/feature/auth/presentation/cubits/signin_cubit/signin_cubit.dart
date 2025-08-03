import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entites/user_entity.dart';
import '../../../domin/repo/auth_repo.dart' show AuthRepo;

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) =>
          emit(SigninFailure(message: failure.message)),
      (userEntity) =>
          emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) =>
          emit(SigninFailure(message: failure.message)),
      (userEntity) =>
          emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
