import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/feature/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/signin_view_body.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../domin/repo/auth_repo.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: ' تسجيل دخول'),
        body: SigninViewBody(),
      ),
    );
  }
}
