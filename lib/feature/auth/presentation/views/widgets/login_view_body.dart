import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/widgets/custom_text_field.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizintalPadding,
        ),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'اسم المستخدم',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
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
              onPressed: () {},
              text: 'تسجيل الدخول',
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'لا تمتلك حساب؟',
                    style: TextStyles.semiBold16.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyles.semiBold16.copyWith(
                      color: const Color(0xFF616A6B),
                    ),
                  ),
                  TextSpan(
                    text: 'قم بإنشاء حساب',
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
