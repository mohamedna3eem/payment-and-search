import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/core/utils/app_images.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/features/auth/presentation/views/login_view.dart';

import '../../../../../core/utils/button_style.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/widgets/bottom_pop_up.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key});

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  final int _codeLength = 6;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  bool isCodeComplete = false;
  final String _expectedCode = '123456'; // Example expected code

  // Timer variables
  int _timeLeft = 120; // 2 minutes in seconds
  late Timer _timer;
  String get _formattedTime {
    final minutes = (_timeLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_timeLeft % 60).toString().padLeft(2, '0');
    return '($minutes:$seconds)';
  }

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(_codeLength, (index) => TextEditingController());
    _focusNodes = List.generate(_codeLength, (index) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  void _verifyCode() {
    String enteredCode =
        _controllers.map((controller) => controller.text).join();
    if (enteredCode == _expectedCode) {
      showSuccessBottomSheet(context, 'Account successfully created!');

      // Navigate after successful verification
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginView(),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid code. Please try again.')),
      );
      for (var controller in _controllers) {
        controller.clear();
      }
      _focusNodes[0].requestFocus();
      setState(() => isCodeComplete = false);
    }
  }

  void _resendCode() {
    // Reset timer
    setState(() {
      _timeLeft = 120;
      if (!_timer.isActive) {
        _startTimer();
      }
    });

    // Clear current fields
    for (var controller in _controllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();

    // Show feedback to user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code resent')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48.h),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              Assets.imageOfVerification,
              width: 350.w,
              height: 216.h,
            ),
          ),
          SizedBox(height: 24.h),

          // Verification title
          Text(
            'Verification Code',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),

          // Instruction text
          Text(
            'Please enter the 6-digit code sent to your phone',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black54,
            ),
          ),

          SizedBox(height: 32.h),

          // Verification code input fields - REDUCED SIZE
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _codeLength,
              (index) => Container(
                width: 40.w, // Reduced from 50.w
                height: 45.h, // Reduced from 50.h
                margin:
                    EdgeInsets.symmetric(horizontal: 2.w), // Reduced from 4.w
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold), // Reduced from 24.sp
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty && index < _codeLength - 1) {
                      FocusScope.of(context)
                          .requestFocus(_focusNodes[index + 1]);
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context)
                          .requestFocus(_focusNodes[index - 1]);
                    }

                    // Check if all fields are filled
                    setState(() {
                      isCodeComplete =
                          _controllers.every((c) => c.text.isNotEmpty);
                    });

                    // Auto-verify when all fields are filled
                    if (isCodeComplete) {
                      // Optional: add a slight delay to allow the user to see what they entered
                      Future.delayed(
                          const Duration(milliseconds: 300), _verifyCode);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0.h, horizontal: 0.w), // Reduced padding
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(6.r), // Reduced from 8.r
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(6.r), // Reduced from 8.r
                      borderSide: const BorderSide(
                          color: ColorManager.secondaryColor,
                          width: 1.5), // Reduced from width: 2
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(6.r), // Reduced from 8.r
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Timer and resend section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formattedTime,
                style: const TextStyle(
                  color: ColorManager.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 6.w),
              const Text(
                "Didn't receive a code?",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: _timeLeft > 0 ? null : _resendCode,
                child: Text(
                  'Resend',
                  style: TextStyle(
                    color: _timeLeft > 0
                        ? Colors.grey
                        : ColorManager.secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 32.h),

          // Confirm button
          ElevatedButton(
            style: ButtonStyles.primaryButton,
            onPressed: isCodeComplete ? _verifyCode : null,
            child: Text(
              'Confirm',
              style: TextStyles.buttonLabel,
            ),
          ),
        ]),
      ),
    );
  }
}
