import 'package:flutter/material.dart';

// Tour Page
class TourMenuPage extends StatelessWidget {
  const TourMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Menu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _buildTourMenu(),
    );
  }

  Widget _buildTourMenu() {
    final List<Map<String, dynamic>> tourItems = [
      {
        "title": "Safari Adventure",
        "description": "Experience a thrilling safari in the wild.",
        "price": "\$199.99",
        "imageUrl":
            "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
      {
        "title": "Beach Resort",
        "description": "Relax at a luxurious beach resort.",
        "price": "\$299.99",
        "imageUrl":
            "https://images.pexels.com/photos/164336/pexels-photo-164336.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
    ];

    return ListView.builder(
      itemCount: tourItems.length,
      itemBuilder: (context, index) {
        final tourItem = tourItems[index];
        return Card(
          margin: const EdgeInsets.all(10),
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
                  tourItem['imageUrl']!,
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
                      tourItem['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(tourItem['description']!),
                    const SizedBox(height: 5),
                    Text(
                      "Price: ${tourItem['price']!}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _openOrderForm(context, tourItem['title']!);
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
      },
    );
  }

  void _openOrderForm(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book $title'),
          content: const OrderForm(),
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

class OrderForm extends StatelessWidget {
  const OrderForm({super.key});

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
            labelText: 'Delivery Address',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
