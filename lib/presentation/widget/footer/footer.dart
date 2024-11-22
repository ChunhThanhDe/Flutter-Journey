import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/assets/app_images.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/constants/app_urls.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > AppBreakpoints.tablet;
    return Center(
      child: SizedBox(
        width: AppBreakpoints.desktop.toDouble(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding(screenWidth)),
          child: Column(
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Image.asset(
                AppImages.logo2Img,
                height: 85,
              ),
              const SizedBox(height: 16),
              Text(
                'Copyright © 2024 - ChunhThanhDe Flutter Journey',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.neutral4, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: isWide ? 88 : 44),
              Container(
                color: Colors.white.withOpacity(0.2),
                height: 1,
              ),
              const SizedBox(height: 32),
              const FooterLinks(),
              SizedBox(height: isWide ? 112 : 96),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > AppBreakpoints.tablet;
    if (isWide) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FooterLink(
            text: 'Contact',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.website));
            },
          ),
          const Spacer(),
          FooterLink(
            text: 'Twitter',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.twitter));
            },
          ),
          const SizedBox(width: 32),
          FooterLink(
            text: 'LinkedIn',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.linkedin));
            },
          ),
          const SizedBox(width: 32),
          FooterLink(
            text: 'GitHub Page',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.githubPage));
            },
          ),
          const SizedBox(width: 32),
          FooterLink(
            text: 'Personal Github',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.myGithub));
            },
          ),
          const SizedBox(width: 32),
          FooterLink(
            text: 'Hashnode',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.hashnode));
            },
          ),
        ],
      );
    } else {
      return Column(
        children: [
          FooterLink(
            text: 'Contact',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.website));
            },
          ),
          const Spacer(),
          FooterLink(
            text: 'Twitter',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.twitter));
            },
          ),
          const SizedBox(height: 40),
          FooterLink(
            text: 'LinkedIn',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.linkedin));
            },
          ),
          const SizedBox(height: 40),
          FooterLink(
            text: 'GitHub Page',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.githubPage));
            },
          ),
          const SizedBox(height: 40),
          FooterLink(
            text: 'Personal Github',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.myGithub));
            },
          ),
          const SizedBox(height: 40),
          FooterLink(
            text: 'Hashnode',
            onTap: () {
              launchUrl(Uri.parse(AppURLs.hashnode));
            },
          ),
        ],
      );
    }
  }
}

class FooterLink extends StatelessWidget {
  const FooterLink({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }
}
