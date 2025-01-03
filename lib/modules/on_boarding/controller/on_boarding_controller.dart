import 'package:cots_2211104022_gideon/design_system/styles/image_col.dart';
import 'package:cots_2211104022_gideon/modules/on_boarding/widgets/content.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  void navigateToMusicPlayer() {
    Get.toNamed('/login');
  }

  final List<OnboardingContent> contents = [
    OnboardingContent(
      title: "Pesan Layanan",
      description: "Temukan berbagai layanan untuk memenuhi kebutuhan Anda",
      image: "${AppImages.illustration1}",
    ),
    OnboardingContent(
      title: "Pengiriman Cepat",
      description: "Nikmati pengiriman yang cepat dan aman ke lokasi Anda",
      image: "${AppImages.illustration2}",
    ),
    OnboardingContent(
      title: "Pembayaran Mudah",
      description: "Berbagai metode pembayaran yang aman dan nyaman",
      image: "${AppImages.illustration3}",
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value == contents.length - 1) {
      // Navigate to next screen
      // Get.offAllNamed(Routes.HOME);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skipOnboarding() {
    // Navigate to next screen
    // Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
