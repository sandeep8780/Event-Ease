import 'package:flutter/material.dart';
import 'Buy_Ticket.dart'; // Import the TicketApp screen

class EventDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Stack(
        children: [
          // Hero Image with Gradient Overlay
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-HhTUlHUrkXbHptpK2HkW3KF21JfZIw.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Top Navigation Bar
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                // Main Content Card
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.32,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Event Title and Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Shere Bangla Concert',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                '\$299 USD',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Location and Date
                        Row(
                          children: const [
                            Icon(Icons.location_on_outlined, size: 20),
                            SizedBox(width: 8),
                            Text('ABC Avenue, Dhaka'),
                            SizedBox(width: 16),
                            Icon(Icons.calendar_today_outlined, size: 20),
                            SizedBox(width: 8),
                            Text('25-27 October, 22'),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Members Section
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 40,
                              child: Stack(
                                children: List.generate(
                                  4,
                                      (index) => Positioned(
                                    left: index * 25.0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.grey[300],
                                      child: const Icon(Icons.person),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '15.7k+ Members are joined',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text('VIEW ALL / INVITE'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Event Organizer
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage('https://placekitten.com/100/100'),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Event Organiser: John Doe',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Book Now Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to TicketApp screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketApp(), // Navigate to TicketApp
                                ),
                              );
                            },
                            child: const Text(
                              'BOOK NOW',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
