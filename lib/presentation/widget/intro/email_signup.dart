import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/common/widget/email_signup_button.dart';
import 'package:flutter_journey/common/widget/email_text_field.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/constants/app_urls.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSignup extends StatelessWidget {
  const EmailSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isWide = screenWidth > AppBreakpoints.tablet;
    final width = isWide ? 522.0 : 337.0;
    return SizedBox(
      width: width,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding(screenWidth)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: isWide ? 50 : 40),
            Text(
              'Plenty of awesome Open Source Flutter projects are waiting for you to dive into and explore! 🔥',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.4),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text:
                    'Everything here is free! If you find something you like, consider starring the repos that interest you. '
                    'Your support gives me the motivation to keep this journey going! 🎯 ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.neutral3, letterSpacing: 0.2),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Follow Flutter Journey',
                      style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: AppColors.neutral2,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(AppURLs.githubPage));
                        }),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // const EmailSignupForm(),
            // const SizedBox(height: 16),
            // Text(
            //   '"Thank you for this great open source. ',
            //   textAlign: TextAlign.center,
            //   style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal, color: Colors.white),
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   'ChunhThanHDe',
            //   textAlign: TextAlign.center,
            //   style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal, color: AppColors.neutral4),
            // ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}

class EmailSignupForm extends StatelessWidget {
  const EmailSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isWide = screenWidth > AppBreakpoints.tablet;
    if (isWide) {
      return const SizedBox(
        height: 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: IntroEmailTextField(),
            ),
            SizedBox(width: 16),
            Expanded(
              child: IntroEmailSignupButton(),
            )
          ],
        ),
      );
    } else {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 48, child: IntroEmailTextField()),
          SizedBox(height: 16),
          SizedBox(
            height: 48,
            child: IntroEmailSignupButton(),
          ),
        ],
      );
    }
  }
}

class IntroEmailTextField extends StatelessWidget {
  const IntroEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmailTextField(
      fillColor: AppColors.neutral6,
      hintColor: AppColors.neutral2,
    );
  }
}

class IntroEmailSignupButton extends StatelessWidget {
  const IntroEmailSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmailSignupButton(
      primary: AppColors.primary5,
      onPrimary: Colors.white,
    );
  }
}
