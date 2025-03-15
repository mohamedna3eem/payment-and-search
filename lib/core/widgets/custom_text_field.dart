import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_now/core/utils/color_manger.dart';

import '../utils/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.lable,
      required this.icon,
      required this.hint,
      this.isPassword = false});
  final String lable;
  final String icon;
  final String hint;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              lable,
              style: TextStyles.inputLabel16,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          obscureText: isPassword == true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: ColorManager.textInputColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: ColorManager.redColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: ColorManager.textInputColor)),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.r),
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: ColorManager.textInputColor),
            suffixIcon: isPassword == true
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off,
                        color: ColorManager.textInputColor))
                : null,
          ),
        ),
      ],
    );
  }
}
