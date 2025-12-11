import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {
  const DefaultHeader({super.key, required this.title, required this.height});

  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32)),
        color: Colors.red.shade700,
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
