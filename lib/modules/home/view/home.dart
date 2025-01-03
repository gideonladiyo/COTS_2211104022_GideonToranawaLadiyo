import 'package:cots_2211104022_gideon/modules/home/view/chat_page.dart';
import 'package:cots_2211104022_gideon/modules/home/view/home_page.dart';
import 'package:cots_2211104022_gideon/modules/home/view/order_page.dart';
import 'package:cots_2211104022_gideon/modules/home/view/promo_page.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_nav.dart';
// import 'package:spotify_group7/common/widget/bottomNav.dart/bottomNav.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomNavbar(
          home: HomePage(),
          promos: PromoPage(),
          offers: OrderPage(),
          chats: ChatPage()),
    );
  }
}