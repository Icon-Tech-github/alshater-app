import 'package:flutter/material.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'https://i.ytimg.com/vi/ZOWquGHDl-8/maxresdefault.jpg',
    'https://img.freepik.com/premium-psd/oatmeal-chocolate-chip-cookies-are-air-sweet-delicious_803636-2701.jpg',
    'https://platraw.com/_next/image?url=https%3A%2F%2Fstorage.googleapis.com%2Fplatrawblobeuwestglive%2Fphoto%2F72916cfb-feb2-4523-b38c-ee2081cbe41b-new%20platraw%20banners-04.png&w=1280&q=70',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return false;

      currentIndex = (currentIndex + 1) % images.length;

      _controller.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}