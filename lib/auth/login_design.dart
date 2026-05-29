// import 'dart:ui';

import 'package:dress_n_design/auth/log_design_logic.dart';
import 'package:dress_n_design/tabbar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginDesign extends StatefulWidget {
  const LoginDesign({super.key});

  @override
  State<LoginDesign> createState() => _LoginDesignState();
}

class _LoginDesignState extends State<LoginDesign> {

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
        accessToken: authorization.accessToken,
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
    return 
       LogDesignLogic(isLoading: isLoading, ongooglesigninpressed: continuewithgoogle);
    
  }
}