import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Dynamic, high-performance aesthetic backdrop gradient
        // Replaces the heavy BackdropFilter blobs to eliminate scrolling lag completely.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF3F5), // Soft blush aura
              Color(0xFFF4F8FC), // Clean off-white core
              Color(0xFFEDF4FE), // Pale sky blue aura
            ],
            stops: [0.1, 0.5, 0.9],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Minimalist Premium Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'FRESH START',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8A95A5), // Cleaned transparency calculations
                            letterSpacing: 2.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Back to School',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1A2530),
                            letterSpacing: -0.8,
                          ),
                        ),
                      ],
                    ),
                    // _buildHeaderRoundButton(Icons.shopping_bag_outlined),
                  ],
                ),
                const SizedBox(height: 28),

                // Main Promo Banner with optimized single soft shadow
                Container(
                  height: 210,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1A2530),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      "assets/backtosale.jpg",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                          _buildImageErrorPlaceholder('Exclusive Sale Event'),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Section Title 
                const Text(
                  'Curated Collections',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50),
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 16),

                // Optimized Clean Lookbook Gallery Grid
                Row(
                  children: [
                    Expanded(child: _buildCleanFeatureCard("assets/boyschoolagain.png", "Boys Look")),
                    const SizedBox(width: 14),
                    Expanded(child: _buildCleanFeatureCard("assets/girlschoolagainn.png", "Girls Look")),
                    const SizedBox(width: 14),
                    Expanded(child: _buildCleanFeatureCard("assets/mrpencilll.png", "Essentials")),
                  ],
                ),
                const SizedBox(height: 36),

                // High-End Category Minimal Control Strips
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPremiumCategory(
                      context, 
                      'Boys\nUniform', 
                      [const Color(0xFF7F7FD5), const Color(0xFF86A8E7)]
                    ),
                    _buildPremiumCategory(
                      context, 
                      'Girls\nUniform', 
                      [const Color(0xFFFF758C), const Color(0xFFFF7EB3)]
                    ),
                    _buildPremiumCategory(
                      context, 
                      'School\nKit', 
                      [const Color(0xFF00B4DB), const Color(0xFF0083B0)]
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Performance-optimized feature card layout using pure opaque decorations
  Widget _buildCleanFeatureCard(String assetPath, String fallbackLabel) {
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => 
              _buildImageErrorPlaceholder(fallbackLabel),
        ),
      ),
    );
  }

  // Refactored structural card with simplified layout shadows
  Widget _buildPremiumCategory(BuildContext context, String title, List<Color> gradientColors) {
    final double computedWidth = (MediaQuery.of(context).size.width - 76) / 3;
    return Container(
      width: computedWidth,
      height: 90,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first,
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

  // Widget _buildHeaderRoundButton(IconData icon) {
  //   return Container(
  //     padding: const EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       shape: BoxShape.circle,
  //       boxShadow: [
  //         BoxShadow(
  //           color: const Color(0xFF1A2530),
  //           blurRadius: 10,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Icon(icon, size: 20, color: const Color(0xFF2C3E50)),
  //   );
  // }

  Widget _buildImageErrorPlaceholder(String label) {
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
