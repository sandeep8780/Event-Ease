import 'package:flutter/material.dart';




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Side Navigation')),
      drawer: Drawer(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                children: [
                  _buildDrawerItem(Icons.person, "My Profile", Colors.blue, () {}),
                  _buildDivider(),
                  _buildDrawerItem(Icons.message, "Messages", Colors.green, () {}),
                  _buildDivider(),
                  _buildDrawerItem(Icons.calendar_today, "Calendar", Colors.orange, () {}),
                  _buildDivider(),
                  _buildDrawerItem(Icons.camera, "Augmented Reality", Colors.purple, () {}),
                  _buildDivider(),
                  _buildDrawerItem(Icons.home, "Home", Colors.teal, () {}),
                  _buildDivider(),
                  _buildDrawerItem(Icons.settings, "Settings", Colors.red, () {}),
                  _buildDivider(),
                  _buildDrawerItem(Icons.contact_mail, "Contact Us", Colors.pink, () {}),
                  _buildDivider(),
                  _buildDrawerItem(Icons.logout, "Logout", Colors.black, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Home Screen')),
    );
  }

  /// Header with gradient background
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/profile.jpg"), // Add image to assets
          ),
          SizedBox(height: 10),
          Text(
            "Sandeep",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "sandeep@example.com",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  /// Custom Drawer Item with ripple effect
  Widget _buildDrawerItem(IconData icon, String title, Color iconColor, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 26, color: iconColor),
            SizedBox(width: 15),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  /// Custom Divider for Spacing
  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Divider(thickness: 1, color: Colors.grey[300]),
    );
  }
}
