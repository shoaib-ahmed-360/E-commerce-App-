import 'package:dress_n_design/auth/login_design.dart';
// import 'package:dress_n_design/tabbar_appbar.dart';
import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'dart:ui'; // Required for BackdropFilter (Glassmorphism)

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginDesign()
    );
  }
}
