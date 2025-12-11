import 'package:flutter/material.dart';
import 'package:alshaatir/core/app_colors.dart';

class DefaultHeader extends StatelessWidget {
  const DefaultHeader({super.key, required this.title, required this.height});

  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.info,
          ],
        ),
      ),
      padding: const EdgeInsets.all(
          16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height,),
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white))
        ],
      ),
    );
  }
}
