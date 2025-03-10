import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/utils/text_style.dart';
import 'package:pharma_now/core/widgets/or_divider.dart';
import 'package:pharma_now/core/widgets/anotherStepLogin.dart';
import 'package:pharma_now/features/auth/presentation/views/forget_password_view.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_up_view.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/custom_text_field.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/singn_up_view_body.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/button_style.dart';
import '../../../../../core/widgets/bottom_pop_up.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(children: [
          CustomTextField(
              lable: 'Email', icon: Assets.emailIcon, hint: 'Enter your email'),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            lable: 'Password',
            icon: Assets.passwordIcon,
            hint: 'Enter your password',
            isPassword: true,
          ),
          SizedBox(
            height: 16.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              splashColor: ColorManager.colorLines,
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, ForgetPasswordView.routeName);
              },
              child: Text(
                'Forgot Password?',
                style: TextStyles.forgetPassword,
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          ElevatedButton(
            style: ButtonStyles.primaryButton,
            onPressed: () => showSuccessBottomSheet(
                context, 'You have signed in successfully'),
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
            height: 175.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyles.callToActionText,
                  ),
                  InkWell(
                    splashColor: ColorManager.colorLines,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SingnUpView(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child:
                        Text(' Sign Up', style: TextStyles.callToActionSignUP),
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
