import 'package:flutter/material.dart';

class Imageerrorplaceholder extends StatelessWidget {
  final String label;
  const Imageerrorplaceholder({super.key , required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF8A95A5), 
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}