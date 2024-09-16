import 'package:flutter/material.dart';

class ResterPage extends StatelessWidget {
  const ResterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rester Menu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _buildResterMenu(),
    );
  }

  Widget _buildResterMenu() {
    final List<Map<String, dynamic>> resterItems = [
      {
        "title": "Pizza",
        "description": "Delicious wood-fired pizza.",
        "price": "\$12.99",
        "imageUrl":
            "https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
      {
        "title": "Sushi",
        "description": "Fresh and authentic sushi.",
        "price": "\$18.99",
        "imageUrl":
            "https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
    ];

    return ListView.builder(
      itemCount: resterItems.length,
      itemBuilder: (context, index) {
        final resterItem = resterItems[index];
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
                  resterItem['imageUrl']!,
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
                      resterItem['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(resterItem['description']!),
                    const SizedBox(height: 5),
                    Text(
                      "Price: ${resterItem['price']!}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _openOrderForm(context, resterItem['title']!);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Keep Order'),
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
          title: Text('Order $title'),
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
