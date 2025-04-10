import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/configs/mycolors.dart';
import 'package:login/views/screens/FavoritesPage.dart'; // Import Favorites Page
import 'package:login/views/screens/ProfilePage.dart';   // Import Profile Page
import 'package:login/views/screens/NotificationsPage.dart'; // Import Notifications Page

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("MEET"),
        automaticallyImplyLeading: false,
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              print("Search button pressed");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("Cart button pressed");
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
            icon: Icon(Icons.notifications), // Notification icon
          ),
          _buildLogoutButton(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "CATEGORIES",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildCategoryList(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Featured Products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildFeaturedProducts(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "New Arrivals",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildNewArrivals(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
            // Home tab (current page)
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
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

  Widget _buildBanner() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/banner.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          "Big Sale - Up to 50% Off!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    final List<Map<String, String>> categories = [
      {"name": "Electronics", "image": "assets/images/electronics.jpg"},
      {"name": "Fashion", "image": "assets/images/fashion.jpg"},
      {"name": "Home & Kitchen", "image": "assets/images/home_kitchen.jpg"},
      {"name": "Sports", "image": "assets/images/sports.jpg"},
      {"name": "Books", "image": "assets/images/books.jpg"},
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    category["image"]!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  category["name"]!,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFeaturedProducts() {
    final List<Map<String, dynamic>> products = [
      {"name": "Nothing phone", "price": "\ksh 55,000", "image": "assets/images/phone.jpg"},
      {"name": "Macbook", "price": "\ksh 150,000", "image": "assets/images/laptop.jpg"},
      {"name": "Beats Studio Pro", "price": "\ksh 22,000", "image": "assets/images/headphones.jpg"},
      {"name": "RTX 5090", "price": "\ksh 300,000", "image": "assets/images/graphics_card.jpeg"},
      {"name": "RYZEN 5 5600X3D", "price": "\ksh 34,000", "image": "assets/images/cpu.jpg"},
      {"name": "ASUS Monitor", "price": "\ksh 40,000", "image": "assets/images/monitor.jpg"},
      {"name": "Louis Vuitton Bathrobe", "price": "\ksh 189,000", "image": "assets/images/bathrobe.png"},
      {"name": "Harry Potter", "price": "\ksh 6000", "image": "assets/images/harry_potter.jpeg"},
    ];
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print("Product tapped: ${products[index]['name']}");
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
                      products[index]["image"],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products[index]["name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(products[index]["price"]),
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

  Widget _buildNewArrivals() {
    final List<Map<String, dynamic>> newArrivals = [
      {"name": "Gucci FlipFlops", "price": "\ksh 40,000", "image": "assets/images/gucciflipflops.jpeg"},
      {"name": "Lingerie", "price": "\ksh 15,000", "image": "assets/images/lingerie.jpeg"},
      {"name": "Fiji Water", "price": "\ksh 23,000", "image": "assets/images/fiji.jpeg"},
      {"name": "Eclaire lattafa", "price": "\ksh 17,000", "image": "assets/images/eclaire.jpg"},
      {"name": "Durex Lube", "price": "\ksh 2000", "image": "assets/images/durex.jpeg"},
      {"name": "Air Jordan VI Travis Scott", "price": "\ksh 57,000", "image": "assets/images/air.jpg"},
    ];
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newArrivals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print("Product tapped: ${newArrivals[index]['name']}");
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
                      newArrivals[index]["image"],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        newArrivals[index]["name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(newArrivals[index]["price"]),
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

  Widget _buildLogoutButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', false); // Mark the user as logged out
        // Navigate back to the Login Page
        Navigator.pushReplacementNamed(context, '/login');
      },
      icon: Icon(Icons.logout),
      tooltip: "Logout",
    );
  }
}