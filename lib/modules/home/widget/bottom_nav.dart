import 'package:flutter/material.dart';

import '../../../design_system/styles/app_color.dart';

class BottomNavbar extends StatefulWidget {
  final Widget home;
  final Widget promos;
  final Widget offers;
  final Widget chats;

  const BottomNavbar({
    super.key,
    required this.home,
    required this.promos,
    required this.offers,
    required this.chats
  }
      );

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> get widgetOptions =>
      [widget.home, widget.promos, widget.offers, widget.chats];

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: widgetOptions.elementAt(selectedIndex),
          )),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 32), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.discount, size: 32,),
                label: "Promos"
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.border_color,
                  size: 32,
                ),
                label: "Offers"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  size: 32,
                ),
                label: "Chats"),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.gojekGreen,
          onTap: onTapped,
        ),
      ),
    );
  }
}