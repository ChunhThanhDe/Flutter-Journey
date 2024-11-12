import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/assets/app_images.dart';
import 'package:flutter_journey/core/configs/assets/app_vectors.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/presentation/widget/intro/email_signup.dart';
import 'package:flutter_journey/presentation/widget/intro/intro_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          const Column(
            children: [
              IntroHeader(),
              EmailSignup(),
            ],
          ),
          if (screenWidth > AppBreakpoints.desktop) ...[
            Positioned(
              top: 100,
              left: 0,
              child: SvgPicture.asset(AppVectors.firebaseIcon),
            ),
            Positioned(
              top: 250,
              right: 0,
              child: SvgPicture.asset(AppVectors.dartIcon),
            ),
            Positioned(
              top: 600,
              right: 100,
              child: SvgPicture.asset(AppVectors.flutterIcon),
            ),
            Positioned(
              top: 480,
              left: 30,
              child: Image.asset(
                AppImages.flameIcon,
                height: 77,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
