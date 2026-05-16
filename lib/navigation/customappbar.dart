import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget  {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(
          'Dress N Design',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.5,
            fontFamily: 'Serif',
          ),
        ),
        centerTitle: true,
        elevation: 8,
        shadowColor: const Color(0xFF1A237E),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A237E), // Deep Royal Indigo
                Color(0xFF3F51B5), // Vibrant Indigo
                Color(0xFF7986CB), // Soft Indigo Accent
              ],
            ),
          ),
        ),
      );
  }

 @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}