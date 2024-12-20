import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/assets/app_images.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';

class MobileNavigationMenu extends StatelessWidget {
  const MobileNavigationMenu({
    super.key,
    required this.onNavigateToProject,
    required this.onNavigateToFlame,
    required this.onNavigateToNewsletter,
    required this.onNavigateToSponsorship,
  });

  final Future<void> Function() onNavigateToProject;
  final Future<void> Function() onNavigateToFlame;
  final Future<void> Function() onNavigateToNewsletter;
  final Future<void> Function() onNavigateToSponsorship;

  static const menuHeight = 56 * 4 + 64;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.neutral6,
      child: ListView(
        shrinkWrap: true,
        children: [
          MobileMenuListTile(
            title: 'Project',
            onTap: onNavigateToProject,
          ),
          MobileMenuListTile(
            title: 'Flame',
            onTap: onNavigateToFlame,
          ),
          MobileMenuListTile(
            title: 'Newsletter',
            onTap: onNavigateToNewsletter,
          ),
          MobileMenuListTile(
            title: 'Sponsorship',
            onTap: onNavigateToSponsorship,
          ),
          Container(
            height: 64.0,
            alignment: Alignment.center,
            child: MobileToggleButton(onPressed: () {}),
          )
        ],
      ),
    );
  }
}

class MobileMenuListTile extends StatelessWidget {
  const MobileMenuListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MobileToggleButton extends StatelessWidget {
  const MobileToggleButton({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.neutral6,
        side: const BorderSide(color: AppColors.neutral2),
        shape: const StadiumBorder(),
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.toggleIcon),
            const SizedBox(width: 12),
            Text('Switch to light mode',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
