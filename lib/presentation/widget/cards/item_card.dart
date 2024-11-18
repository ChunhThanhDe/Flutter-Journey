import 'package:flutter/material.dart';
import 'package:flutter_journey/common/utils/tags.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/core/configs/theme/app_text_theme.dart';
import 'package:flutter_journey/presentation/widget/cards/border_mouse_hover.dart';

class ItemCardData {
  const ItemCardData({
    required this.imageSource,
    required this.title,
    required this.description,
    required this.tags,
    required this.metadata1,
    required this.metadata2,
  });
  final String imageSource;
  final String title;
  final String description;
  final List<String> tags;
  final String metadata1;
  final String metadata2;

  static final allProjectData = [
    const ItemCardData(
      imageSource:
          'https://raw.githubusercontent.com/ChunhThanhDe/ChunhThanhde-Project/main/VNPT%20Technology/Security%20DroidSettings/DroidSettings.png',
      title: 'DroidSettings',
      description:
          'Developed integration for DroidSettings - a custom settings application for Amlogic TV chip series: integrates security features for the settings application, locks sensitive functional modes, and supports disabling IPv6. The application helps manage settings and system security efficiently.',
      tags: ['Android', 'Java', 'System Application'],
      metadata1: 'System Application',
      metadata2: 'Highlight',
    ),
    const ItemCardData(
      imageSource:
          'https://raw.githubusercontent.com/ChunhThanhDe/ChunhThanhde-Project/main/VNPT%20Technology/Security%20Uboot/security%20-%20uboot.png',
      title: 'VNPTT Uboot',
      description:
          'Custom Uboot - development of a custom security solution for Uboot, which helps to lock Uboot and the console command port connected via UART. This patch enhances security, prevents device rooting, and protects the system from unauthorized access.',
      tags: ['Embedded Systems', 'Uboot', 'UART', 'Security', 'Bootloader'],
      metadata1: 'Security Bootloader',
      metadata2: 'Highlight',
    ),
  ];

  static final allFlameData = [
    const ItemCardData(
      imageSource:
          'https://raw.githubusercontent.com/ChunhThanhDe/ChunhThanhde-Project/main/VNPT%20Technology/Security%20DroidSettings/DroidSettings.png',
      title: 'DroidSettings',
      description:
          'Developed integration for DroidSettings - a custom settings application for Amlogic TV chip series: integrates security features for the settings application, locks sensitive functional modes, and supports disabling IPv6. The application helps manage settings and system security efficiently.',
      tags: ['Android', 'Java', 'System Application'],
      metadata1: 'System Application',
      metadata2: 'Highlight',
    ),
    const ItemCardData(
      imageSource:
          'https://raw.githubusercontent.com/ChunhThanhDe/ChunhThanhde-Project/main/VNPT%20Technology/Security%20Uboot/security%20-%20uboot.png',
      title: 'VNPTT Uboot',
      description:
          'Custom Uboot - development of a custom security solution for Uboot, which helps to lock Uboot and the console command port connected via UART. This patch enhances security, prevents device rooting, and protects the system from unauthorized access.',
      tags: ['Embedded Systems', 'Uboot', 'UART', 'Security', 'Bootloader'],
      metadata1: 'Security Bootloader',
      metadata2: 'Highlight',
    ),
  ];
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.data});
  final ItemCardData data;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding =
        screenWidth >= AppBreakpoints.tablet ? 32.0 : 20.0;
    final verticalPadding = screenWidth >= AppBreakpoints.tablet ? 24.0 : 16.0;
    return BorderMouseHover(
      builder: (context, value) => Column(
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: DecoratedBox(
              // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data.imageSource),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ItemMetadataWidget(
                    startText: data.metadata1, endText: data.metadata2),
                if (data.tags.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  ItemMetadataTags(tags: data.tags),
                  const SizedBox(height: 20),
                ] else
                  const SizedBox(height: 18),
                Text(
                  data.description,
                  // TODO: Responsive?
                  style: DesktopTextTheme()
                      .paragraph18
                      .copyWith(color: AppColors.neutral2, height: 1.666),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMetadataWidget extends StatelessWidget {
  const ItemMetadataWidget(
      {super.key, required this.startText, required this.endText});

  final String startText;
  final String endText;

  @override
  Widget build(BuildContext context) {
    // TODO: Responsive with LayoutBuilder
    return Text(
      '$startText | $endText',
      textAlign: TextAlign.left,
      style: DesktopTextTheme().subhead.copyWith(color: AppColors.neutral2),
    );
    // TODO: Would be nice to make this work without overflow
    // return Row(
    //   children: [
    //     Text(
    //       startText,
    //       style: DesktopTextTheme()
    //           .subheadAllCaps
    //           .copyWith(color: AppColors.neutral2),
    //     ),
    //     const SizedBox(width: 10),
    //     Container(
    //       height: 16,
    //       width: 1,
    //       color: AppColors.neutral2,
    //     ),
    //     const SizedBox(width: 10),
    //     Text(
    //       endText,
    //       overflow: TextOverflow.clip,
    //       style: DesktopTextTheme()
    //           .subheadAllCaps
    //           .copyWith(color: AppColors.neutral2),
    //     ),
    //   ],
    // );
  }
}

class ItemMetadataTags extends StatelessWidget {
  const ItemMetadataTags({super.key, required this.tags});
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 0,
      children: [
        for (final tag in tags)
          Chip(
            backgroundColor: tag.color().backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            label: Text(
              tag,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.normal, color: tag.color().color),
            ),
          ),
      ],
    );
  }
}
