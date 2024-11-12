import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/core/configs/theme/app_text_theme.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({super.key});

  double topPadding(double maxWidth) {
    if (maxWidth > AppBreakpoints.tablet) {
      return 122;
    } else if (maxWidth > AppBreakpoints.mobile) {
      return 71;
    } else {
      return 53;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 880,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: topPadding(screenWidth)),
            Text(
              'Learn Dart, Flutter &\nFirebase, Flame',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white, letterSpacing: 0.2),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                text: 'Want to become a Flutter pro and create amazing apps?\n'
                    'Check out my open-source projects to speed up your Journey! ',
                style: DesktopTextTheme()
                    .paragraph20
                    .copyWith(color: AppColors.neutral2),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'all for free!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
