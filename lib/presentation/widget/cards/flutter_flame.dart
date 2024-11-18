import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
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
              SizedBox(
                height:
                    screenWidth > AppBreakpoints.twoColLayoutMinWidth ? 32 : 12,
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
