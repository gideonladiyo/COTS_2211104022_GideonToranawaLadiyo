import 'package:cots_2211104022_gideon/modules/on_boarding/view/on_boarding.dart';
import 'package:cots_2211104022_gideon/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoute.routes,
      home: OnboardingScreen(),
    );
  }
}
