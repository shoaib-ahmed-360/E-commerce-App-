import 'package:dress_n_design/tabbar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:ui'; // Required for BackdropFilter (Glassmorphism)

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  String? userid;
  bool isLoading = false;
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    userid = supabase.auth.currentUser?.id;
    supabase.auth.onAuthStateChange.listen((data) {
      if (mounted) {
        setState(() {
          userid = data.session?.user.id;
        });
      }
    });
  }

  Future<void> continuewithgoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      final signIn = GoogleSignIn.instance;
      await signIn.initialize(
        serverClientId: '863487921499-alr5lblppr6q29sgoob2hat8ga5oc0gb.apps.googleusercontent.com',
      );

      final GoogleSignInAccount? account = await signIn.authenticate();
      if (account == null) {
        setState(() => isLoading = false);
        return; // User canceled the sign-in
      }

      final String idToken = account.authentication.idToken ?? '';
      if (idToken.isEmpty) {
        print('No ID token received');
        setState(() => isLoading = false);
        return;
      }

      final authorization = await account.authorizationClient
              .authorizationForScopes(['email', 'profile']) ??
          await account.authorizationClient
              .authorizeScopes(['email', 'profile']);

      final result = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization?.accessToken,
      );

      if (result.user != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Bars()),
        );
      }
    } catch (e) {
      print(e);
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Aesthetic Gradient Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A), // Deep Slate Blue
              Color(0xFF1E1B4B), // Deep Indigo
              Color(0xFF312E81), // Rich Violet
            ],
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
                          onPressed: isLoading ? null : continuewithgoogle,
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
                              color: Colors.white.withOpacity(0.5),
                              decoration: TextDecoration.underline,
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
      ),
    );
  }
}
