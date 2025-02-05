import 'package:flutter/material.dart';

import 'Event_Details.dart';

class ConcertDetailsScreen extends StatefulWidget {
  const ConcertDetailsScreen({Key? key}) : super(key: key);

  @override
  _ConcertDetailsScreenState createState() => _ConcertDetailsScreenState();
}

class _ConcertDetailsScreenState extends State<ConcertDetailsScreen> {
  bool _isLiked = false;
  bool _isAnimating = false;

  void _onLikePressed() {
    setState(() {
      _isLiked = !_isLiked;
      _isAnimating = true;
    });

    // Reset animation after it's complete
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _isAnimating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-P21DNN9ocHuQWr9fdv3YkDm5q0FjvR.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_border,
                            color: _isLiked ? Colors.red : Colors.white,
                          ),
                          onPressed: _onLikePressed,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Concert Details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shere Bangla Band',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Music Concert',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.orange, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Parul University Avenue, Vadodara',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.orange, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '25-27 january, 25',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: List.generate(
                          4,
                              (index) => Container(
                            margin: const EdgeInsets.only(right: 4),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1),
                              image: DecorationImage(
                                image: NetworkImage('https://picsum.photos/200?random=$index'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '15 Members are joined',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the Event Details Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventDetailsScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'CHOOSE YOUR SEAT',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Animated Heart Light
          if (_isAnimating)
            Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _isAnimating ? 1.0 : 0.0,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 100,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
