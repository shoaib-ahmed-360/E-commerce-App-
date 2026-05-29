import 'package:dress_n_design/bottombars/CleanFeatureCard.dart';
import 'package:dress_n_design/bottombars/ImageErrorPlaceholder.dart';
import 'package:dress_n_design/bottombars/PremiumCategory.dart';
import 'package:flutter/material.dart';

class HomeDesign extends StatelessWidget {
  const HomeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          Imageerrorplaceholder(label: 'Exclusive Sale Event'),
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
                    Expanded(child: BuildCleanFeatureCard(assetPath: "assets/boyschoolagain.png",
                    fallbackLabel:  "Boys Look" ,  onTap: () {
                      
                    },)),
                    const SizedBox(width: 14),
                    Expanded(child: BuildCleanFeatureCard(assetPath: "assets/girlschoolagainn.png",
                    fallbackLabel:  "Girls Look" , onTap: () {
                      
                    },)),
                    const SizedBox(width: 14),
                    Expanded(child: BuildCleanFeatureCard(assetPath: "assets/mrpencilll.png",
                    fallbackLabel: "Essentials" , onTap: () {
                      
                    },)),
                  ],
                ),
                const SizedBox(height: 36),

                // High-End Category Minimal Control Strips
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildPremiumcategory(title:'Boys\nUniform' ,
                    gradient: [const Color(0xFF7F7FD5), const Color(0xFF86A8E7)],
                      onTap: () {
                        
                      },
                    ),
                    BuildPremiumcategory(title:'Girls\nUniform' ,
                    gradient: [const Color(0xFFFF758C), const Color(0xFFFF7EB3)],
                      onTap: () {
                        
                      },
                    ),
                     BuildPremiumcategory(title:'School\nKit' ,
                    gradient: [const Color(0xFF00B4DB), const Color(0xFF0083B0)],
                      onTap: () {
                        
                      },
                    ),
                   
                  
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}