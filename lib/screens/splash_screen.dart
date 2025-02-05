import 'package:flutter/material.dart';
import 'dart:async';
import 'OnboardingScreen.dart'; // Import the OnboardingScreen file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showLogo = true;

  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds and then swap the view
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showLogo = false; // Toggle the flag to swap views
      });

      // Navigate to OnboardingScreen after 3 seconds
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Conditional rendering for logo and text
            AnimatedSwitcher(
              duration: Duration(seconds: 1), // Duration for the swap
              child: _showLogo
                  ? Container(
                key: ValueKey<int>(1), // Unique key for animation
                child: Image.asset(
                  'assets/logo2.png', // Your logo image path
                  fit: BoxFit.contain, // Keep the natural size
                ),
              )
                  : SizedBox.shrink(), // Empty container when logo is hidden
            ),

            // The "Event Ease" text in the center
            _showLogo
                ? SizedBox.shrink() // Empty container when logo is visible
                : Column(
              children: [
                SizedBox(height: 30), // Spacing
                Text(
                  "Event Ease",
                  style: TextStyle(
                    fontSize: 30, // Adjusted text size
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black text color
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 20), // Space for loading symbol
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
