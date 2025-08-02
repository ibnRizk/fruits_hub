import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/feature/auth/presentation/cubits/signup_cubits/signup_cubit.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../domin/repo/auth_repo.dart';
import 'widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {},
          builder: (context, state) {
            return const SignupViewBody();
          },
        ),
      ),
    );
  }
}
