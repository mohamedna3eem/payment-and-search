import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma_now/constants.dart';
import 'package:pharma_now/core/services/shard_preferences_singlton.dart';
import 'package:pharma_now/core/utils/app_images.dart';
import 'package:pharma_now/features/auth/presentation/views/login_view.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../../core/utils/text_style.dart';
import 'widget/onboarding_data.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static const routeName = 'OnboardingView';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: 'About us',
      description:
          'PharmaNow application helps people to find medicine and \n medical cosmetic products at reasonable prices and also provides daily and weekly offers on products',
      imagePath: Assets.onboardingImage1,
    ),
    OnboardingData(
      title: 'E-Pharmacy',
      description:
          'Chat directly with a pharmacist or get instant help anytime with our smart AI chatbot',
      imagePath: Assets.onboardingImage2,
    ),
    OnboardingData(
      title: 'Medical Delivery',
      description:
          'Spend time with your family and we will deliver everything you need',
      imagePath: Assets.onboardingImage3,
    ),
  ];
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive calculations
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final bool isSmallScreen = screenHeight < 700;
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildCard(),
                    ],
                  ),
                )
              ],
            ),
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) => _buildPage(
                  _onboardingData[index],
                  screenHeight,
                  screenWidth,
                  isSmallScreen),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingData onboardingData, double screenHeight,
      double screenWidth, bool isSmallScreen) {
    return Column(
      children: [
        _topBar(),
        SizedBox(
          height:
              screenHeight * 0.06, // Responsive spacing (6% of screen height)
        ),
        SvgPicture.asset(
          onboardingData.imagePath,
          height: isSmallScreen
              ? screenHeight * 0.3
              : screenHeight * 0.35, // Responsive image size
          width: screenWidth * 0.8, // 80% of screen width
          fit: BoxFit.contain,
        ),
        SizedBox(
          height:
              screenHeight * 0.092, // Responsive spacing (4% of screen height)
        ),
        _buildInfoWidget(onboardingData, screenHeight)
      ],
    );
  }

  Widget _topBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width * 0.04, // 4% of screen width
        vertical:
            MediaQuery.of(context).size.height * 0.02, // 2% of screen height
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: _currentPage != 0,
            child: InkWell(
              child: SvgPicture.asset(
                Assets.arrowLeft,
                color: ColorManager.colorOfArrows,
              ),
              onTap: () => _pageController.animateToPage(
                --_currentPage,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              prefs.setBool(kIsOnBoardingViewSeen, true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
            child: Text(
              'Skip',
              style: TextStyles.skip,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              Assets.informationCard,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoWidget(OnboardingData onboardingData, double screenHeight) {
    bool isSmallScreen = screenHeight < 700;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width * 0.033, // 6% of screen width
        vertical: isSmallScreen
            ? 12
            : 24, // Adjust vertical padding based on screen size
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              onboardingData.title,
              style: TextStyles.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: isSmallScreen
                  ? 12
                  : 24, // Adjust spacing based on screen size
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    1, // 80% of screen width
              ),
              child: Text(
                onboardingData.description,
                style: TextStyles.description,
                maxLines: 3, // Allow one more line on smaller screens
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: isSmallScreen
                  ? 12
                  : 24, // Adjust spacing based on screen size
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _onboardingData
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: e == onboardingData
                              ? ColorManager.primaryColor
                              : ColorManager.primaryColor.withAlpha(80),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: isSmallScreen
                  ? 12
                  : 24, // Adjust spacing based on screen size
            ),
            GestureDetector(
              child: SvgPicture.asset(Assets.onboardingButton),
              onTap: () {
                if (_currentPage == _onboardingData.length - 1) {
                  prefs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                  // Set isSeen to true
                } else {
                  _pageController.animateToPage(
                    ++_currentPage,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
