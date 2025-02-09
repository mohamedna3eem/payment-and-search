import 'package:flutter/material.dart';
import 'package:pharma_now/core/utils/app_images.dart';
import 'package:pharma_now/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          subtitle:
              'PharmaNow application helps people to find medicine and\n medical cosmetic products at reasonable prices and also\n provides daily and weekly offers on products',
          title: 'About us',
          image: Assets.OnBoardingImage1,
        ),
        PageViewItem(
          subtitle:
              'Chat directly with a pharmacist or get instant help anytime with our smart AI chatbot',
          title: 'E-Pharmacy',
          image: Assets.OnBoardingImage2,
        ),
        PageViewItem(
          subtitle:
              'Spend time with your family and we will deliver everything you need',
          title: 'Medical Delivery',
          image: Assets.OnBoardingImage3,
        )
      ],
    );
  }
}
