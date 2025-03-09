import 'package:flutter/material.dart';
import 'package:pharma_now/core/utils/color_manger.dart';

class ButtonStyles {
  ButtonStyles._();

  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
      maximumSize: Size(double.infinity, 48),
      minimumSize: Size(double.infinity, 48),
      backgroundColor: ColorManager.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)));
}
