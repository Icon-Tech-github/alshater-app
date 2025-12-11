import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTapSeeAll;

  const SectionHeader({required this.title, this.onTapSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
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