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
      this.isPassword = false,
      this.onSaved,
      required this.textInputType});
  final String lable;
  final String icon;
  final String hint;
  final bool? isPassword;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
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
          keyboardType: textInputType,
          onSaved: onSaved,
          validator: (value) {
            validator:
            (value) {
              if (value == null || value.isEmpty) {
                return 'The field cannot be empty';
              }
              return null;
            };
          },
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


class CustomTextFormField extends StatefulWidget {
  Color? filledColor;
  Color borderColor;
  TextStyle? hintStyle;
  String? hintText;
  Widget? label;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  bool isObscureText;
  bool isPassword;
  TextStyle? textStyle;
  bool readonly;

  CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.isPassword = false,
    this.filledColor = Colors.white,
    this.keyboardType = TextInputType.text,
    this.borderColor =  Colors.white,
    this.readonly = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 20.h),
      child: TextFormField(
        style: widget.textStyle,
        obscureText: widget.isObscureText,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.validator,
        readOnly: widget.readonly,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.filledColor,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          label: widget.label,
          labelStyle: widget.labelStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
              onPressed: () {
                widget.isObscureText = !widget.isObscureText;
                setState(() {});
              },
              icon: Icon(widget.isObscureText
                  ? Icons.visibility_off
                  : Icons.visibility))
              : widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: widget.borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: widget.borderColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}

