import 'package:flutter/material.dart';

class BrandStrip extends StatelessWidget {
  const BrandStrip();

  @override
  Widget build(BuildContext context) {
    final brands = [
      'https://1000logos.net/wp-content/uploads/2021/05/Coca-Cola-logo.png',
      'https://www.halal4allshop.com/wp-content/uploads/2025/01/Almarai-Logo-removebg-preview.png',
      'https://static.wikia.nocookie.net/logopedia/images/a/aa/Unilever_2004.svg/revision/latest/scale-to-width-down/200?cb=20190410112840',
      'https://1000logos.net/wp-content/uploads/2017/04/Pampers-Logo.png',
    ];
    return SizedBox(
      height: 72,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final brand = brands[index];
          return Image.network(
            brand,
          );
        },
      ),
    );
  }
}
