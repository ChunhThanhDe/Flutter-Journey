import 'package:flutter/material.dart';

class NavigationLink extends StatelessWidget {
  const NavigationLink({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextButton(
          onPressed: onTap,
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
