import 'package:flutter/material.dart';
import 'product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/sercing.png'),
        ),
        title: Column(
          children: [
            Text(
              'MAKE HOME',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
            const Text(
              'BEAUTIFUL',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/images/troli.png', width: 28),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCategoryItem('assets/images/bintang.png', 'Popular', true),
                _buildCategoryItem('assets/images/kursi.png', 'Chair', false),
                _buildCategoryItem('assets/images/meja.png', 'Table', false),
                _buildCategoryItem('assets/images/sofajos.png', 'Armchair', false),
                _buildCategoryItem('assets/images/kasur.png', 'Bed', false),
              ],
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.65,
              children: [
                _buildProductCard(
                  context,
                  'Black Simple Lamp',
                  '12.00',
                  'assets/images/lampubelajar.png',
                ),
                _buildProductCard(
                  context,
                  'Minimal Stand',
                  '25.00',
                  'assets/images/kursiputih.png',
                ),
                _buildProductCard(
                  context,
                  'Coffee Chair',
                  '12.00',
                  'assets/images/kursikayu.png',
                ),
                _buildProductCard(
                  context,
                  'Simple Desk',
                  '12.00',
                  'assets/images/sofaputih.png',
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/homejosjis.png', width: 24), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/simpan.png', width: 24), 
            label: 'Saved'
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bell.png', width: 24), 
            label: 'Notif'
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bi_person.png', width: 24), 
            label: 'Profile'
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              imagePath, 
              color: isSelected ? Colors.white : Colors.grey.shade600
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String name, String price, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (name == 'Minimal Stand') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductScreen()), // Pastikan nama Class di product_screen.dart adalah DetailScreen
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        print("Tambah $name ke keranjang");
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/images/tasjos.png', 
                          width: 20, 
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            '\$ $price',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}