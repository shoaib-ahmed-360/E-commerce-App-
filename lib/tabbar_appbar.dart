import 'package:dress_n_design/navigation/customappbar.dart';
import 'package:dress_n_design/navigation/custombottombar.dart';
import 'package:dress_n_design/navigation/cutomdrawer.dart';
import 'package:flutter/material.dart';
import 'package:dress_n_design/bottombars/cart.dart';
import 'package:dress_n_design/bottombars/home.dart';
import 'package:dress_n_design/bottombars/profile.dart';

// 1. Import your custom bottom bar file here
// import 'package:dress_n_design/navigation/custom_bottom_bar.dart'; 

class Bars extends StatefulWidget {
  const Bars({super.key});

  @override
  State<Bars> createState() => _BarsState();
}

class _BarsState extends State<Bars> {
  final PageController _pageController = PageController();
  int _currentState = 0; // Tracks the active tab index

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(),
      drawer: Customdrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentState = index;
          });
        },
        children: const [
          Home(),
          Cart(),
          Profile(),
        ],
      ),
      
      // 2. Pass variables and functions down into your widget
      bottomNavigationBar: Custombottombar(
        currentState: _currentState, // Sends current state value into widget
        onTap: (index) {            // Listens for clicks coming back out
          setState(() {
            _currentState = index;
            if (_pageController.hasClients) {
              _pageController.jumpToPage(index);
            }
          });
        },
      ),
    );
  }
}
