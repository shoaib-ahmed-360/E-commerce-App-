import 'package:dress_n_design/bottombars/ImageErrorPlaceholder.dart';
import 'package:flutter/material.dart';

class BuildCleanFeatureCard extends StatelessWidget {
  final String assetPath;
  final String fallbackLabel;
  final VoidCallback onTap;

  const BuildCleanFeatureCard({super.key ,required this.assetPath ,
   required this.fallbackLabel , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A2530),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => 
                Imageerrorplaceholder(label : fallbackLabel),
          ),
        ),
        
      ),
    );

    
  }
}