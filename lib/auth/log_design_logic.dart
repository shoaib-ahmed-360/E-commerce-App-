import 'dart:ui';

import 'package:dress_n_design/tabbar_appbar.dart';
import 'package:flutter/material.dart';
// import 'package:dress_n_design/auth/login_design.dart';
// package:dress_n_design/auth/login_design.dart

class LogDesignLogic extends StatelessWidget {
  final bool isLoading;
  final VoidCallback ongooglesigninpressed;
  const LogDesignLogic({super.key , required this.isLoading , required this.ongooglesigninpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        // Aesthetic Gradient Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A237E), Color(0xFF3F51B5), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App Icon or Brand Graphic
                      const Icon(
                        Icons.lock_outline_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      
                      // Title & Subtitle
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Sign in to continue to your account",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Google Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: isLoading ? null : ongooglesigninpressed,
                          child: isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF312E81),
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/google.png',
                                      height: 24,
                                    ),
                                    const SizedBox(width: 16),
                                    const Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      
                      // Sign out option (if logged in)
                      
                        const SizedBox(height: 24),
                        TextButton(
                          onPressed: () => Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Bars() ,)),
                          child: Text(
                            "browse as guest",
                            style: TextStyle(
                              color: Colors.white,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}