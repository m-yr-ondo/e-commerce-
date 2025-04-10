import 'package:flutter/material.dart';
import 'package:login/views/screens/LandingPage.dart'; // Import LandingPage
import 'package:login/views/screens/ProfilePage.dart';

import '../../configs/mycolors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
        leading: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pic2.png",
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Your Favorite Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildFavoriteProducts(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
              break;
            case 1:
            // Already on FavoritesPage
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteProducts() {
    final List<Map<String, dynamic>> favoriteProducts = [
      {"name": "Nothing phone", "price": "\ksh 55,000", "image": "assets/images/phone.jpg"},
      {"name": "Macbook", "price": "\ksh 150,000", "image": "assets/images/laptop.jpg"},
      {"name": "Lingerie", "price": "\ksh 15,000", "image": "assets/images/lingerie.jpeg"},
    ];
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print("Product tapped: ${favoriteProducts[index]['name']}");
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      favoriteProducts[index]["image"],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        favoriteProducts[index]["name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(favoriteProducts[index]["price"]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}