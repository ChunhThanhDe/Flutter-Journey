import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/assets/app_images.dart';
import 'package:flutter_journey/core/configs/constants/app_breakpoints.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';
import 'package:flutter_journey/presentation/widget/app_header/mobile_navigation_menu.dart';
import 'package:flutter_journey/presentation/widget/app_header/navigation_icon_button.dart';
import 'package:flutter_journey/presentation/widget/app_header/navigation_link.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isWide = screenWidth > AppBreakpoints.tablet;
    return Container(
      color: AppColors.neutral7,
      child: isWide
          ? const DesktopNavigationLayout()
          : const MobileNavigationLayout(),
    );
  }
}

class DesktopNavigationLayout extends StatelessWidget {
  const DesktopNavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isVeryWide = screenWidth > AppBreakpoints.desktop;
    return SizedBox(
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: isVeryWide ? 80 : 28),
          Image.asset(AppImages.logoImg),
          const Spacer(),
          const NavigationLink(text: 'Tutorials'),
          const NavigationLink(text: 'Courses'),
          const NavigationLink(text: 'Newsletter'),
          const NavigationLink(text: 'Sponsorship'),
          NavigationIconButton(child: Image.asset(AppImages.searchIcon)),
          NavigationIconButton(child: Image.asset(AppImages.toggleIcon)),
          SizedBox(width: isVeryWide ? 80 : 28),
        ],
      ),
    );
  }
}

class MobileNavigationLayout extends StatefulWidget {
  const MobileNavigationLayout({super.key});

  @override
  State<MobileNavigationLayout> createState() => _MobileNavigationLayoutState();
}

class _MobileNavigationLayoutState extends State<MobileNavigationLayout>
    with SingleTickerProviderStateMixin {
  late final _menuController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 150));

  void _toggleMenu() {
    if (_menuController.isCompleted) {
      _menuController.reverse();
    } else {
      _menuController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _menuController,
        builder: (context, _) {
          final height =
              64 + _menuController.value * MobileNavigationMenu.menuHeight;
          return SizedBox(
            height: height,
            child: Column(
              children: [
                SizedBox(
                  height: 64,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 28),
                      Image.asset(AppImages.logoImg),
                      const Spacer(),
                      NavigationIconButton(
                          child: Image.asset(AppImages.searchIcon)),
                      GestureDetector(
                        onTap: _toggleMenu,
                        child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _menuController,
                          color: AppColors.neutral2,
                        ),
                      ),
                      //NavigationIconButton(assetName: Constants.hamburgerMenu),
                      const SizedBox(width: 28),
                    ],
                  ),
                ),
                const Expanded(child: MobileNavigationMenu()),
              ],
            ),
          );
        });
  }
}
