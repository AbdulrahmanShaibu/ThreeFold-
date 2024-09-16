import 'package:flutter/material.dart';

class FoodMenuPage extends StatelessWidget {
  const FoodMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _buildFoodMenu(),
    );
  }

  Widget _buildFoodMenu() {
    final List<Map<String, dynamic>> foodItems = [
      {
        "title": "Grilled Chicken",
        "description": "Delicious grilled chicken with herbs",
        "ingredients": "Chicken, Herbs, Olive Oil",
        "price": "\$12.99",
        "imageUrl":
            "https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
      {
        "title": "Pasta Alfredo",
        "description": "Creamy Alfredo sauce over pasta",
        "ingredients": "Pasta, Alfredo Sauce, Parmesan",
        "price": "\$10.49",
        "imageUrl":
            "https://images.pexels.com/photos/1435891/pexels-photo-1435891.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
    ];

    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        final foodItem = foodItems[index];
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
                  foodItem['imageUrl']!,
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
                      foodItem['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(foodItem['description']!),
                    const SizedBox(height: 5),
                    Text(
                      "Ingredients: ${foodItem['ingredients']!}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Price: ${foodItem['price']!}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _openOrderForm(context, foodItem['title']!);
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

  void _openOrderForm(BuildContext context, String foodTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order for $foodTitle'),
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
