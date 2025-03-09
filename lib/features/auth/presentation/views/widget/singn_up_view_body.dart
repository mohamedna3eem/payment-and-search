import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/core/utils/button_style.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/utils/text_style.dart';
import 'package:pharma_now/core/widgets/anotherStepLogin.dart';
import 'package:pharma_now/core/widgets/or_divider.dart';
import 'package:pharma_now/features/auth/presentation/views/login_view.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_up.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/custom_text_field.dart';

import '../../../../../core/utils/app_images.dart';

class SingnUpBody extends StatelessWidget {
  const SingnUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(children: [
          CustomTextField(
              lable: 'Name', icon: Assets.nameIcon, hint: 'Enter your name'),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
              lable: 'Email', icon: Assets.emailIcon, hint: 'Enter your email'),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            lable: 'Password',
            icon: Assets.passwordIcon,
            hint: 'Enter your pasword',
            isPassword: true,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            lable: 'Confirm Password',
            icon: Assets.passwordIcon,
            hint: 'Enter your pasword',
            isPassword: true,
          ),
          SizedBox(
            height: 24.h,
          ),
          ElevatedButton(
            style: ButtonStyles.primaryButton,
            onPressed: () {},
            child: Text(
              'Sign In',
              style: TextStyles.buttonLabel,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          OrDivider(),
          SizedBox(
            height: 25.h,
          ),
          AnotherStepLogin(
            text: 'Continue with Google',
            icon: Assets.google_Icon,
          ),
          SizedBox(
            height: 15.h,
          ),
          AnotherStepLogin(
            text: 'Continue with Facebook',
            icon: Assets.facebook_Icon,
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyles.callToActionText,
                  ),
                  InkWell(
                    splashColor: ColorManager.colorLines,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, LoginView.routeName);
                    },
                    child: Text(' Login', style: TextStyles.callToActionSignUP),
                  ),
                  SizedBox(
                    height: 8.h,
                  )
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
