import 'package:flutter/material.dart';
import 'package:login/views/screens/LandingPage.dart';
import 'package:login/views/screens/FavoritesPage.dart';

import '../../configs/mycolors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/user.jpg"),
            ),
            SizedBox(height: 20),
            Text(
              "User Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildUserInfo("Name", "Emmanuel Ochieng"),
            _buildUserInfo("Email", "ochieng@gmail.com"),
            _buildUserInfo("Phone", "+254 23456789"),
            _buildUserInfo("Address", "Daystar University, Athi River"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Change Password initiated");
              },
              child: Text("Change Password"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesPage()),
              );
              break;
            case 2:

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

  Widget _buildUserInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(value),
        SizedBox(height: 10),
      ],
    );
  }
}