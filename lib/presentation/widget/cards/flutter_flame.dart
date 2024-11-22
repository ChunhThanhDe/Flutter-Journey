import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/core/configs/theme/app_text_theme.dart';
import 'package:flutter_journey/presentation/widget/cards/item_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FlutterFlameHeader extends StatelessWidget {
  const FlutterFlameHeader({super.key});

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter Flame',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Invest in yourself with my high-quality Flutter Flame.',
                        style: DesktopTextTheme()
                            .paragraph18
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  if (screenWidth > AppBreakpoints.twoColLayoutMinWidth) ...[
                    const Spacer(),
                    const ExploreFlameButton(),
                  ],
                ],
              ),
              SizedBox(
                height:
                    screenWidth > AppBreakpoints.twoColLayoutMinWidth ? 52 : 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlutterFlameContent extends StatelessWidget {
  const FlutterFlameContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount =
        screenWidth >= AppBreakpoints.twoColLayoutMinWidth ? 2 : 1;
    return SliverPadding(
      padding: EdgeInsets.symmetric(
          horizontal: sliverHorizontalPadding(screenWidth)),
      sliver: SliverAlignedGrid.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 24,
        crossAxisSpacing: 40,
        itemCount: ItemCardData.allFlameData.length,
        itemBuilder: (context, index) {
          return ItemCard(data: ItemCardData.allFlameData[index]);
        },
      ),
    );
  }
}

class ExploreFlameButton extends StatelessWidget {
  const ExploreFlameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.primary7,
          backgroundColor: AppColors.secondary,
          splashFactory: NoSplash.splashFactory,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Text(
        'Explore More Project  →',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, color: AppColors.primary7),
      ),
      onPressed: () {},
    );
  }
}
