import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/presentation/widget/app_header/app_header.dart';
import 'package:flutter_journey/presentation/widget/intro/intro.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColors.neutral7,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: AppHeader()),
            SliverToBoxAdapter(child: Intro()),
          ],
        ),
      ),
    );
  }
}
