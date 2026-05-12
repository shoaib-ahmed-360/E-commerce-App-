import 'package:dress_n_design/bottombars/cart.dart';
import 'package:dress_n_design/bottombars/home.dart';
import 'package:dress_n_design/bottombars/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Bars extends StatefulWidget {
  const Bars({super.key});

  @override
  State<Bars> createState() => _BarsState();
}

class _BarsState extends State<Bars> {
  PageController pageController = PageController();
  int currentstate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text('MR Kamran Mogul'), 
            accountEmail: Text('kami123@gmail.com'),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person),),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.indigo,
                Colors.white38
              ])
            ),
            ),
           SizedBox(
            height: 500,
           ),
              // ),
            Container(
              
                height: 50,
                width: 95,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) ,
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.cyan,
                  // Colors.indigo
                ])
                // , color: Colors.deepOrange
                ),
                
              child: ElevatedButton(
                child: Text('Admin Portal'),
                
                onPressed: () {

                }
              )
            )
            // ElevatedButton(onPressed: () {}, child: Text('Admin Portal'))
          ],
        ),
        
      ),
      appBar: AppBar(
  title: const Text(
    'Dress N Design',
    style: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.italic,
      letterSpacing: 2.0,
      fontFamily: 'Serif', // Use a premium font family if available
    ),
  ),
  centerTitle: true,
  elevation: 4,
  shadowColor: Colors.black.withOpacity(0.25),
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1A237E), // Deep Royal Indigo
          Color(0xFF3F51B5), // Vibrant Indigo
          Color(0xFF7986CB), // Soft Indigo Accent
        ],
      ),
    ),
  ),
 
),

      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentstate = index;
          });
        } ,
        children: [
          Home(),
          Cart(),
          Profile()
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.white38
        ]),
        currentIndex: currentstate,
        onTap: (index) => setState(() {
          currentstate = index;
          if(pageController.hasClients){
            pageController.jumpToPage(index);
          }
        }),
        
        items:[
       BottomBarItem(icon: (FaIcon(FontAwesomeIcons.house , color: Colors.indigo,)), title: Text("Home" , style: TextStyle(color: Colors.indigo),)),
       BottomBarItem(icon: FaIcon(FontAwesomeIcons.cartShopping , color: Colors.indigo,), title: Text('Cart' ,style: TextStyle(color: Colors.indigo),)),
       BottomBarItem(icon: FaIcon(FontAwesomeIcons.person , color: Colors.indigo,), title: Text('Profile' , style: TextStyle(color: Colors.indigo),))
        ] , 
        option: AnimatedBarOptions(iconStyle: IconStyle.animated)),
      // bottomNavigationBar: BottomAppBar(
      //  child: Row(
      //    children: [
      //      Icon(Icons.home),

      //    ],
      //  ), 
       
      // ),
    );
  }
}