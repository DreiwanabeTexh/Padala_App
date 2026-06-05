import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:padala_app/pages/home.dart';
import 'package:padala_app/pages/order.dart';
import 'package:padala_app/pages/profile.dart';
import 'package:padala_app/pages/poster.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Widget> _pages;

  int currentIndex = 0;

  late Home home;
  late Poster posterpage;
  late Orderpage order;
  late Profilepage profilepage;

  @override
  void initState() {
    home = Home();
    posterpage = Poster();
    order = Orderpage();
    profilepage = Profilepage();

    _pages = [home, posterpage, order, profilepage];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff4B5945),
        backgroundColor: Colors.transparent,
        height: 70,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.post_add, size: 30, color: Colors.white,),
          Icon(Icons.shopping_bag, size: 30, color: Colors.white,),
          Icon(Icons.person, size: 30, color: Colors.white,),
        ]
      ),
      body: _pages[currentIndex],
    );
  }
}