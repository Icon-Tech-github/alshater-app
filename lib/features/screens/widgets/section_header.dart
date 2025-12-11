import 'package:alshaatir/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTapSeeAll;
  final IconData? icon;

  const SectionHeader({
    required this.title,
    this.onTapSeeAll,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 22,
              color: AppColors.warning,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          if (onTapSeeAll != null)
            TextButton(
              onPressed: onTapSeeAll,
              child: const Text('عرض الكل'),
            ),
        ],
      ),
    );
  }
}