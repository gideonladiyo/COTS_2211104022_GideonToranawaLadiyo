import 'package:cots_2211104022_gideon/design_system/styles/app_color.dart';
import 'package:cots_2211104022_gideon/design_system/styles/image_col.dart';
import 'package:cots_2211104022_gideon/modules/on_boarding/widgets/content.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0, 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.gojekLogo,
              height: 40,
            ),
            Image.asset(
              AppImages.language,
              height: 40,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: _contents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _contents[index].image,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _contents[index].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _contents[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _contents.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (_currentPage == _contents.length - 1) {
                              // Aksi jika halaman terakhir
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                          child: Text(
                            _currentPage == _contents.length - 1
                                ? 'Masuk'
                                : 'Lanjut',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: AppColors.green),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Aksi tombol Lewati
                          },
                          child: const Text(
                            'Belum ada akun?, Daftar dulu',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16,
                            ),
                          ),
                        ),                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _currentPage == index ? Colors.green : Colors.grey.shade300,
      ),
    );
  }
}