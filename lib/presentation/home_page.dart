import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/common/widget/section_separator.dart';
import 'package:flutter_journey/presentation/widget/about_me/about_me.dart';
import 'package:flutter_journey/presentation/widget/app_header/app_header.dart';
import 'package:flutter_journey/presentation/widget/cards/featured_project.dart';
import 'package:flutter_journey/presentation/widget/cards/flutter_flame.dart';
import 'package:flutter_journey/presentation/widget/email_footer/email_footer.dart';
import 'package:flutter_journey/presentation/widget/footer/footer.dart';
import 'package:flutter_journey/presentation/widget/intro/intro.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final introKey = GlobalKey();
  final featuredProjectKey = GlobalKey();
  final flutterFlameKey = GlobalKey();
  final aboutMeKey = GlobalKey();
  final contactsKey = GlobalKey();
  double introWidth = 0;
  double featuredProjectWidth = 0;
  double flutterFlameWidth = 0;
  double aboutMeWidth = 0;
  double contactsWidth = 0;

  final ScrollController _scrollController = ScrollController();

  Future scrollToItem(GlobalKey sectionKey) async {
    print(sectionKey.toString());
    final context = sectionKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral7,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          WebSmoothScroll(
            controller: _scrollController,
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(child: Intro(key: introKey)),
                const SliverToBoxAdapter(child: SectionSeparator()),
                SliverToBoxAdapter(
                    child: FeaturedProjectHeader(key: featuredProjectKey)),
                const FeaturedProjectContent(),
                const SliverToBoxAdapter(child: SectionSeparator()),
                SliverToBoxAdapter(
                    child: FlutterFlameHeader(key: flutterFlameKey)),
                const FlutterFlameContent(),
                const SliverToBoxAdapter(child: SectionSeparator()),
                SliverToBoxAdapter(child: AboutMe(key: aboutMeKey)),
                SliverToBoxAdapter(child: Footer(key: contactsKey)),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppHeader(
              onNavigateToProject: () => scrollToItem(featuredProjectKey),
              onNavigateToFlame: () => scrollToItem(flutterFlameKey),
              onNavigateToNewsletter: () => scrollToItem(contactsKey),
              onNavigateToSponsorship: () => scrollToItem(contactsKey),
            ),
          ),
        ],
      ),
    );
  }
}
