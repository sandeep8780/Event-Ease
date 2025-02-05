import 'package:flutter/material.dart';
import 'ConcertDetailsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = -1; // Default no category selected
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // GlobalKey for Scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assigning the global key to Scaffold
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer(); // Open the drawer on profile click
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.orange,
                        child: const Icon(Icons.person, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi Welcome 👋',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Chopda Drashti',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.orange, size: 16),
                        Text(
                          'Baroda, 391760',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find amazing events',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.filter_list, color: Colors.white),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(height: 32), // Increased space between Search Bar and Event Cards

                // Event Cards
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to ConcertDetailsScreen on tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConcertDetailsScreen(),
                            ),
                          );
                        },
                        child: _buildEventCard(
                          'Band Music Concert',
                          '12-15 March, 25',
                          'Wadpadrika Avenue, Baroda',
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          // Navigate to ConcertDetailsScreen on tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConcertDetailsScreen(),
                            ),
                          );
                        },
                        child: _buildEventCard(
                          'Shere Bangla Concert IN PU',
                          '25-27 Feb',
                          'Degin Ground Parul University',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48), // Increased space after Event Cards

                // Category Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        _selectedCategoryIndex = 0; // Design
                      }),
                      child: _buildCategoryItem(Icons.palette, 'Design', _selectedCategoryIndex == 0),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _selectedCategoryIndex = 1; // Art
                      }),
                      child: _buildCategoryItem(Icons.art_track, 'Art', _selectedCategoryIndex == 1),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _selectedCategoryIndex = 2; // Sports
                      }),
                      child: _buildCategoryItem(Icons.sports_soccer, 'Sports', _selectedCategoryIndex == 2),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _selectedCategoryIndex = 3; // Music
                      }),
                      child: _buildCategoryItem(Icons.music_note, 'Music', _selectedCategoryIndex == 3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(String title, String date, String location) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-zjlMFEvngLrrcvi1rIWVfTvP08rjWS.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text(date, style: const TextStyle(color: Colors.white70)),
                const SizedBox(width: 16),
                const Icon(Icons.location_on, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text(location, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title, bool isSelected) {
    return Column(
      children: [
        Icon(icon, color: isSelected ? Colors.orange : Colors.grey),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.orange : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
            backgroundImage: AssetImage("assets/profile2.png"), // Add image to assets
          ),
          SizedBox(height: 10),
          Text(
            "Drashti",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "drashti2003@example.com",
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
