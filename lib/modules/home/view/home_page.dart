import 'package:cots_2211104022_gideon/design_system/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../design_system/styles/image_col.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  Widget _buildGopayCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'gopay',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Rp7.434',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tap for history',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGopayMenuItem(Icons.add, 'Top Up'),
              _buildGopayMenuItem(Icons.payment, 'Pay'),
              _buildGopayMenuItem(Icons.explore, 'Explore'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGopayMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF0081A0)),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildMainMenu() {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.motorcycle, 'label': 'GoRide', 'color': Colors.green},
      {'icon': Icons.car_rental, 'label': 'GoCar', 'color': Colors.green},
      {'icon': Icons.restaurant, 'label': 'GoFood', 'color': Colors.red},
      {'icon': Icons.local_shipping, 'label': 'GoSend', 'color': Colors.green},
      {'icon': Icons.shopping_cart, 'label': 'GoMart', 'color': Colors.red},
      {'icon': Icons.phone_android, 'label': 'GoPulsa', 'color': Colors.red},
      {'icon': Icons.star, 'label': 'GoClub', 'color': Colors.purple},
      {'icon': Icons.more_horiz, 'label': 'More', 'color': Colors.grey},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: menuItems[index]['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                menuItems[index]['icon'],
                color: menuItems[index]['color'],
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              menuItems[index]['label'],
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPromoCard(String title, String subtitle, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 160,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'BARU!',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  hintText: 'Find services, food, or places',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Image.asset(
              AppImages.akun,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGopayCard(),
              const SizedBox(height: 24),
              _buildMainMenu(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.restaurant, color: Colors.red, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Restos near me',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildPromoCard(
                'Makin Seru',
                'Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia',
                AppImages.promo1
              ),
              _buildPromoCard(
                'Makin Seru',
                'Sambungin Akun ke Tokopedia, Banyakin Untung',
                AppImages.promo2
              ),
              _buildPromoCard(
                'Makin Seru',
                'Promo Belanja Online 10.10: Cashback hingga Rp100.000',
                AppImages.promo3
              ),
            ],
          ),
        ),
      ),
    );
  }
}