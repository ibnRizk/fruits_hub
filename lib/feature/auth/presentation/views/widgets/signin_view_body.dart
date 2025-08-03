import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/utils/widgets/password_field.dart';
import 'package:fruits_hub/feature/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/feature/auth/presentation/views/widgets/or_divider.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_account_widget.dart';
import 'social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() =>
      _SigninViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode =
    AutovalidateMode.disabled;
late String email, password;

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();
  AutovalidateMode autovalidateMode =
      AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizintalPadding,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(
                      email,
                      password,
                    );
                  } else {
                    autovalidateMode =
                        AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل الدخول',
              ),
              SizedBox(height: 32),

              DontHaveAnAccountWidget(),
              SizedBox(height: 32),
              OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {
                  context
                      .read<SigninCubit>()
                      .signinWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesApplIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
