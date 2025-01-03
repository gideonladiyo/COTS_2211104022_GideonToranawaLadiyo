import 'package:cots_2211104022_gideon/modules/home/view/home.dart';
import 'package:cots_2211104022_gideon/modules/home/view/home_page.dart';
import 'package:cots_2211104022_gideon/modules/login_register/view/login.dart';
import 'package:cots_2211104022_gideon/modules/on_boarding/view/on_boarding.dart';
import 'package:get/get.dart';

class AppRoute {
  static const onBoarding = '/on-boarding';
  static const login = '/login';
  static const homepage = '/home-page';

  static final routes = [
    GetPage(
      name: onBoarding,
      page: () => const  OnboardingScreen(),
    ),
    GetPage(
      name: login, 
      page: () => const LoginPage()
    ),
    GetPage(
        name: homepage,
        page: () => const Home()
    )
  ];
}
