import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Custombottombar extends StatelessWidget {
  final int currentState;
  final ValueChanged<int> onTap;
  
  const Custombottombar({super.key , required this.currentState , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  StylishBottomBar(
        currentIndex: currentState,
        onTap: onTap,
        items: [
          BottomBarItem(
            icon: const FaIcon(FontAwesomeIcons.house , color: Colors.indigo,),
            title: const Text("Home" , style: TextStyle(color: Colors.indigo),),
          ),
          BottomBarItem(
            icon: const FaIcon(FontAwesomeIcons.cartShopping , color: Colors.indigo),
            title: const Text('Cart' , style: TextStyle(color: Colors.indigo),),
          ),
          BottomBarItem(
            icon: const FaIcon(FontAwesomeIcons.user , color: Colors.indigo),
            title: const Text('Profile' ,  style: TextStyle(color: Colors.indigo),),
          ),
        ],
        option: AnimatedBarOptions(
          iconStyle: IconStyle.animated,
          
          // activeColor: Colors.indigo,
          padding: const EdgeInsets.all(15),
        ),
      );
  }
}