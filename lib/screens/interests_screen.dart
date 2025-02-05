import 'package:eventease/screens/select_location_screen.dart';
import 'package:flutter/material.dart';
import 'select_location_screen.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> selectedInterests = [];

  final List<Map<String, dynamic>> interests = [
    {'icon': Icons.music_note, 'label': 'Music'},
    {'icon': Icons.palette, 'label': 'Art'},
    {'icon': Icons.sports_basketball, 'label': 'Sports'},
    {'icon': Icons.restaurant, 'label': 'Food'},
    {'icon': Icons.more_horiz, 'label': 'Others'},
  ];

  void toggleSelection(String label) {
    setState(() {
      if (selectedInterests.contains(label)) {
        selectedInterests.remove(label);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Select Your Interests',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose up to 3 Interests',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  final interest = interests[index];
                  final isSelected = selectedInterests.contains(interest['label']);
                  return GestureDetector(
                    onTap: () => toggleSelection(interest['label']),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.deepPurple[50] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? Colors.deepPurple : Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            interest['icon'],
                            size: 60,
                            color: isSelected ? Colors.deepPurple : Colors.grey[700],
                          ),
                          SizedBox(height: 12),
                          Text(
                            interest['label'],
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected ? Colors.deepPurple : Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedInterests.length == 3
                  ? () {
                // Change button color when pressed
                setState(() {
                  // Example: Change button color when clicked
                  // Here we are making the button turn green
                });
                // Navigate to the LocationSelectionPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationSelectionPage()),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedInterests.length == 3 ? Colors.green : Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.black45,
                elevation: 5,
              ),
              child: Text(
                'SAVE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
// image code
import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  // Store selected interests
  List<String> selectedInterests = [];

  // Interest data with images
  final List<Map<String, dynamic>> interests = [
    {'image': 'assets/design.png', 'label': 'Design'},
    {'image': 'assets/music.png', 'label': 'Music'},
    {'image': 'assets/art.png', 'label': 'Art'},
    {'image': 'assets/sports.png', 'label': 'Sports'},
    {'image': 'assets/food.png', 'label': 'Food'},
    {'image': 'assets/others.png', 'label': 'Others'},
  ];

  void toggleSelection(String label) {
    setState(() {
      if (selectedInterests.contains(label)) {
        selectedInterests.remove(label);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Your 3 Interests',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85, // Adjusted for image and text
                ),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  final interest = interests[index];
                  final isSelected = selectedInterests.contains(interest['label']);
                  return GestureDetector(
                    onTap: () => toggleSelection(interest['label']),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange[50] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? Colors.orange : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              interest['image'], // Replace with your image path
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            interest['label'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.orange : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedInterests.length == 3
                  ? () {
                      // Handle Next action
                      print("Selected Interests: $selectedInterests");
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'NEXT',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InterestsScreen(),
  ));
}


 */