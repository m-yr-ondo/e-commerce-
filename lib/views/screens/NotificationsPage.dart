import 'package:flutter/material.dart';

import '../../configs/mycolors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pic.png",
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Recent Notifications",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildNotifications(),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifications() {
    final List<String> notifications = [
      "Big Sale - Up to 50% Off on Electronics!",
      "Exclusive Offer: Free Shipping on Orders Over \$200",
      "New Arrival: Latest Fashion Collection Now Available",
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            trailing: Icon(Icons.notifications),
          );
        },
      ),
    );
  }
}