import 'package:flutter/material.dart';
import 'package:flutter_journey/common/widget/email_signup_button.dart';
import 'package:flutter_journey/common/widget/email_text_field.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';

class EmailFooterSection extends StatelessWidget {
  const EmailFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.primary5,
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding(screenWidth)),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                'Get the best Flutter tutorials, right in your inbox.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 24),
              const EmailFooterSectionBody(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailFooterSectionBody extends StatelessWidget {
  const EmailFooterSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 337,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FooterEmailTextField(),
          SizedBox(height: 16),
          FooterEmailSignupButton(),
          SizedBox(height: 16),
          EmailFormFooterText(),
        ],
      ),
    );
  }
}

class EmailFormFooterText extends StatelessWidget {
  const EmailFormFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Check my ',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppColors.primary2),
        children: <TextSpan>[
          TextSpan(
            text: 'newsletter page',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white, decoration: TextDecoration.underline),
          ),
          TextSpan(
            text: ' to learn what\'s inside.',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary2),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class FooterEmailTextField extends StatelessWidget {
  const FooterEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48,
      child: EmailTextField(
        fillColor: AppColors.primary6,
        hintColor: AppColors.primary2,
      ),
    );
  }
}

class FooterEmailSignupButton extends StatelessWidget {
  const FooterEmailSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48,
      child: EmailSignupButton(
        primary: Colors.white,
        onPrimary: AppColors.primary7,
      ),
    );
  }
}
