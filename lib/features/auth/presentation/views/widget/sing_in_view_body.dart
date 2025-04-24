import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/utils/text_style.dart';
import 'package:pharma_now/core/widgets/or_divider.dart';
import 'package:pharma_now/core/widgets/anotherStepLogin.dart';
import 'package:pharma_now/features/auth/presentation/views/forget_password_view.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_up_view.dart';
import 'package:pharma_now/core/widgets/custom_text_field.dart';
import 'package:pharma_now/features/home/presentation/views/home_view.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/button_style.dart';

class SiginViewBody extends StatelessWidget {
  const SiginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(children: [
          CustomTextField(
              textInputType: TextInputType.emailAddress,
              lable: 'Email',
              icon: Assets.emailIcon,
              hint: 'Enter your email'),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            textInputType: TextInputType.visiblePassword,
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
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeView.routeName);
            },
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
            height: 150.h,
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
                    height: 8,
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
