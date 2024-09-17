import 'package:flutter/material.dart';

// Tour Menu Page
class TourMenuPage extends StatelessWidget {
  const TourMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Menu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _buildTourMenu(context),
    );
  }

  Widget _buildTourMenu(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> categorizedTourItems = {
      "Adventure Tours": [
        {
          "title": "Safari Adventure",
          "description": "Experience a thrilling safari in the wild.",
          "price": "\$199.99",
          "imageUrl":
              "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=400"
        },
        {
          "title": "Mountain Hiking",
          "description": "Trek through stunning mountain paths.",
          "price": "\$159.99",
          "imageUrl":
              "https://images.pexels.com/photos/1396419/pexels-photo-1396419.jpeg?auto=compress&cs=tinysrgb&w=400"
        },
      ],
      "Relaxation Tours": [
        {
          "title": "Beach Resort",
          "description": "Relax at a luxurious beach resort.",
          "price": "\$299.99",
          "imageUrl":
              "https://images.pexels.com/photos/164336/pexels-photo-164336.jpeg?auto=compress&cs=tinysrgb&w=400"
        },
        {
          "title": "Spa Weekend",
          "description": "Pamper yourself with a weekend at a luxury spa.",
          "price": "\$349.99",
          "imageUrl":
              "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=400"
        },
      ],
    };

    return ListView(
      children: categorizedTourItems.keys.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Column(
              children: categorizedTourItems[category]!.map((tourItem) {
                return Card(
                  key: ValueKey(tourItem['title']),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          tourItem['imageUrl'],
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tourItem['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(tourItem['description']),
                            const SizedBox(height: 5),
                            Text(
                              "Price: ${tourItem['price']}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                _openBookingForm(context, tourItem['title']);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Book Now'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        );
      }).toList(),
    );
  }

  void _openBookingForm(BuildContext context, String tourTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book $tourTitle'),
          content: const BookingForm(),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class BookingForm extends StatelessWidget {
  const BookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Full Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
