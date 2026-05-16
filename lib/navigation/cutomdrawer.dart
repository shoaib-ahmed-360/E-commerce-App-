import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1A237E), Color(0xFF3F51B5), Colors.white],
            ),
          ),
          child: Column(
            
            children: [
              UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: const Text(
                  'MR Kamran Mogul',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                accountEmail: const Text('kami123@gmail.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FaIcon(FontAwesomeIcons.user, color: Color(0xFF1A237E)),
                ),
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
              const Spacer(),
              // Admin Portal Button with glowing aesthetic
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  height: 55,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.deepOrange, Colors.orangeAccent],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrange,
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Admin Portal
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.screwdriverWrench, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Admin Portal',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
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