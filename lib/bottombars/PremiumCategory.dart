import 'package:flutter/material.dart';

class BuildPremiumcategory extends StatelessWidget {
  final String title;
  final List <Color> gradient;
  final VoidCallback onTap;
  const BuildPremiumcategory({super.key , required this.title ,
   required this.gradient , required this.onTap});

  @override
  Widget build(BuildContext context) {
     final double computedWidth = (MediaQuery.of(context).size.width - 76) / 3;
    return Container(
      width: computedWidth,
      height: 90,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradient.first,
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}