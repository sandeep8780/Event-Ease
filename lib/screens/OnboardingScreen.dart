import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async'; // Import for Timer
import 'CountrySelectionScreen.dart'; // Import your country selection screen

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  late Timer _timer; // Declare the timer

  @override
  void initState() {
    super.initState();

    // Set a timer to change pages every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_controller.page == 2) {
        _controller.jumpToPage(0); // Loop back to first page
      } else {
        _controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2; // Update based on the last page index
                  });
                },
                children: [
                  buildPage(
                    imagePath: 'assets/event2.png',
                    title: 'Explore Upcoming and Nearby Events',
                    description: 'In publishing and graphic design, Lorem is a placeholder text commonly.',
                  ),
                  buildPage(
                    imagePath: 'assets/event3.png',
                    title: 'Stay Updated',
                    description: 'Get notified about events you are interested in!',
                  ),
                  buildPage(
                    imagePath: 'assets/event4.png',
                    title: 'Join the Community',
                    description: 'Connect with people who share your interests.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Skip to country selection screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => CountrySelectionScreen()),
                      );
                    },
                    child: Text('Skip'),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (isLastPage) {
                        // Navigate to the country selection screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => CountrySelectionScreen()),
                        );
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(isLastPage ? 'Done' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage({required String imagePath, required String title, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
