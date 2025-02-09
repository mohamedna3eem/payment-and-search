import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_now/core/utils/app_images.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.subtitle,
      required this.title,
      required this.image});

  final String image;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SizedBox(
          width: 307.11, // Set the desired width
          height: 228.83, // Set the desired height
          child: SvgPicture.asset(
            image,
            fit: BoxFit.fill, // Adjust the fit as needed
          ),
        ),
        SizedBox(height: 63.07),
        SizedBox(
          width: double.infinity,
          height: 337,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.Information_Card,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                top: 60,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Positioned(
                top: 106,
                left: 8,
                right: 8,
                child: Text(
                  subtitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 232,
                left: 158.5,
                right: 158.5,
                // Set the desired height
                child: SvgPicture.asset(
                  Assets.OnBoardingButton,
                  fit: BoxFit.fill, // Adjust the fit as needed
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
