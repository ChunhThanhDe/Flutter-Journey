import 'package:flutter/material.dart';
import 'package:flutter_journey/common/widget/avatar.dart';
import 'package:flutter_journey/core/configs/assets/app_images.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/core/configs/theme/app_text_theme.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: AppBreakpoints.desktop.toDouble(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding(screenWidth)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABOUT ME',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.primary4,
                    ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello, I\'m Chung ',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(width: 20),
                  Image.asset(AppImages.dartIcon, height: 80),
                ],
              ),
              const SizedBox(height: 56),
              const AboutMeContent(),
              SizedBox(height: screenWidth > AppBreakpoints.tablet ? 64 : 40),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > AppBreakpoints.tablet) {
      return const AboutMeContentDesktop();
    } else {
      return const AboutMeContentMobile();
    }
  }
}

class AboutMeContentDesktop extends StatelessWidget {
  const AboutMeContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth > AppBreakpoints.tablet
        ? 33.0
        : (screenWidth > 640 ? 27.0 : 24.0);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Avatar(assetName: AppImages.meImg, size: 120),
                  const SizedBox(width: 50),
                  Expanded(
                    child: Text(
                      'I\'m a Software Developer focused on Dart & Flutter.',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        height: 1.22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'I created this website to to share my Flutter journey, support the Flutter community, and bring positive energy.',
                  style: DesktopTextTheme()
                      .paragraph18
                      .copyWith(color: AppColors.neutral2),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 96),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: AboutParagraph1(),
            ),
            SizedBox(width: 24),
            Flexible(
              flex: 1,
              child: AboutParagraph2(),
            ),
          ],
        )
      ],
    );
  }
}

class AboutMeContentMobile extends StatelessWidget {
  const AboutMeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth > AppBreakpoints.tablet
        ? 36.0
        : (screenWidth > 640 ? 27.0 : 24.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Avatar(assetName: AppImages.logoImg, size: 96),
        const SizedBox(height: 24),
        Text(
          'I\'m a Software Developer focused on Dart & Flutter.',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            height: 1.22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 72),
        const AboutParagraph1(),
        const SizedBox(height: 40),
        const AboutParagraph2(),
      ],
    );
  }
}

class AboutParagraph1 extends StatelessWidget {
  const AboutParagraph1({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutParagraph(
      heading: 'Why Flutter?',
      content: """
Flutter is the future of mobile app development. You can build native apps fast and run them on multiple platforms with a single codebase.

It allows for quicker development, especially with hot reload and restart. The performance is great for most apps, and being open-source, you can easily explore and understand the code.
  """,
    );
  }
}

class AboutParagraph2 extends StatelessWidget {
  const AboutParagraph2({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutParagraph(
      heading: 'What\'s my flutter project style?',
      content: """
I believe in writing clean, efficient code that mirrors real-world applications. I focus on breaking down complex tasks into manageable steps and encourage you to trust the learning process.

In my view, a great developer is someone whose code speaks for itself:

- Their code is adaptable and easy to modify.
- Their work is well-documented for clarity.
- They validate their code with thorough testing.

If you’re looking to connect, visit my Contact Page. For inquiries about paid work, take a look at my Services Page.

Happy coding!
  """,
    );
  }
}

class AboutParagraph extends StatelessWidget {
  const AboutParagraph(
      {super.key, required this.heading, required this.content});
  final String heading;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(height: 32),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.neutral2),
        ),
      ],
    );
  }
}
