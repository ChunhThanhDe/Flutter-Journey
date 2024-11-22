import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/presentation/widget/cards/item_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeaturedProjectHeader extends StatelessWidget {
  const FeaturedProjectHeader({super.key});

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
                  Text(
                    'Featured Project',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                  if (screenWidth > AppBreakpoints.twoColLayoutMinWidth) ...[
                    const Spacer(),
                    const ExploreProjectButton(),
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

class FeaturedProjectContent extends StatelessWidget {
  const FeaturedProjectContent({super.key});

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
        itemCount: ItemCardData.allProjectData.length,
        itemBuilder: (context, index) {
          return ItemCard(data: ItemCardData.allProjectData[index]);
        },
      ),
    );
  }
}

class FeaturedProjectFooter extends StatelessWidget {
  const FeaturedProjectFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= AppBreakpoints.twoColLayoutMinWidth) {
      return const Column(
        children: [
          SizedBox(height: 40),
          ExploreProjectButton(),
        ],
      );
    } else {
      // TODO: return something more lightweight
      return const SizedBox();
    }
  }
}

class ExploreProjectButton extends StatelessWidget {
  const ExploreProjectButton({super.key});

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
