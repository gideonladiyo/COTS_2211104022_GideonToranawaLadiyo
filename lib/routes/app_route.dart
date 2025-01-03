import 'package:cots_2211104022_gideon/modules/on_boarding/view/on_boarding.dart';
import 'package:get/get.dart';

class AppRoute {
  static const onBoarding = '/on-boarding';
  static const login = '/login';
  static const register = '/register';

  static final routes = [
    GetPage(
      name: onBoarding,
      page: () => OnboardingScreen(),
    ),
  ];
}
