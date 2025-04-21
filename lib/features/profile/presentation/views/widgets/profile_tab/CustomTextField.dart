import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef validation = String? Function(String?)?;

class CustomTextfield extends StatelessWidget {
  String hinttext;
  Widget? preficon;
  Widget? suficon;
  TextStyle? texthintStyle;
  Color? bordercolor; // لون الحدود
  Color? indicatorcolor; // لون المؤشر
  Color? iconColor; // لون الأيقونات
  Color? textColor; // لون النص داخل الحقل
  Color? focusedBorderColor; // لون الحدود عند التركيز
  Color? errorBorderColor; // لون الحدود عند حدوث خطأ
  Color? backgroundColor; // لون خلفية الزرار
  int? linesnumber;
  validation? validator;
  TextEditingController? controller;

  // Constructor مع إضافة الخصائص
  CustomTextfield({
    required this.hinttext,
    // this.backgroundColor,
    this.preficon,
    this.suficon,
    this.texthintStyle,
    this.bordercolor,
    this.controller,
    this.linesnumber,
    this.validator,
    this.indicatorcolor,
    this.iconColor,
    this.textColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.backgroundColor, // إضافة الخاصية الجديدة
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: textColor ?? Colors.black), // تخصيص لون النص داخل الحقل
        showCursor: true,
        validator: validator,
        decoration: InputDecoration(
          filled: true, // إضافة هذه الخاصية لضمان أن اللون يظهر

          prefixIcon: preficon,
          suffixIcon: suficon,
          fillColor: backgroundColor ?? Colors.white, // تخصيص لون الخلفية
          prefixIconColor: iconColor ?? Colors.grey, // لون الأيقونة
          suffixIconColor: iconColor ?? Colors.grey, // لون الأيقونة
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(color: bordercolor ?? Colors.transparent, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: focusedBorderColor ?? Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: errorBorderColor ?? Colors.red, width: 2),
          ),
          hintText: hinttext,
          hintStyle: texthintStyle ?? TextStyle(color: Colors.grey), // تخصيص لون النص التلميحي
        ),
        cursorColor: indicatorcolor ?? Colors.blue, // لون المؤشر
        maxLines: linesnumber ?? 1,
      ),
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
      padding: EdgeInsets.only(top: 12, bottom: 20),
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
