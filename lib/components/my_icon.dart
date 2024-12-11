import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyIcon extends StatelessWidget {
  final String imageUrl;
  void Function()? onTap;

  MyIcon({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
