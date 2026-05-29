import 'package:flutter/material.dart';

class SplashUi extends StatelessWidget {
   late Animation<double> fadeAnimation;
  SplashUi({super.key , required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return Container(
        // Synchronized background gradient matching the Home screen layout
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFBFBFA), // Pearl white
              Color(0xFFF7F6F2), // Soft warm cream
              Color(0xFFF2EFE9), // Calming linen white
            ],
            stops: [0.1, 0.5, 0.9],
          ),
        ),
        child: FadeTransition(
          opacity: fadeAnimation,
          child: Stack(
            children: [
              // Central Branding Area
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFEBEAE4), // Opaque aesthetic blend shadow matching Home
                            blurRadius: 40,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/logodress.png",
                        height: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 28),
                    // High-end brand main typography
                    const Text(
                      "DRESS & DESIGN",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 7.0,
                        color: Color(0xFF2C2A29), // Rich soft charcoal
                        fontFamily: 'Serif', 
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Your Dress ! Our Resposibility",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 4.0,
                        color: Color(0xFF9E9B98), // Solid muted taupe instead of transparency
                      ),
                    ),
                  ],
                ),
              ),
              // Minimalist matching progress ring at the very bottom
              const Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFCCD5D9), // Clean solid sage white loader indicator
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}