import 'package:flutter/material.dart';

void main() => runApp(const FoodMenuApp());

class FoodMenuApp extends StatelessWidget {
  const FoodMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FoodMenuPage(),
    );
  }
}

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  List<Order> _orders = [];
  bool _isLoggedIn = false; // Track login status

  // Categories for filtering
  final List<String> _categories = ['All', 'Salads', 'Soups', 'Pizzas'];

  // Complete menu data
  final Map<String, List<Map<String, dynamic>>> _menuData = {
    "Salads": [
      {
        "title": "Caesar Salad",
        "description":
            "Fresh, crisp Caesar salad with romaine, croutons, and Caesar dressing.",
        "ingredients": "Lettuce, Caesar Dressing, Croutons, Parmesan Cheese",
        "price": "\$8.99",
        "imageUrl":
            "https://images.pexels.com/photos/1352298/pexels-photo-1352298.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
      {
        "title": "Chicken Garden Salad with Ranch Dressing",
        "description":
            "A hearty salad with grilled chicken and ranch dressing.",
        "ingredients": "Grilled Chicken, Lettuce, Tomatoes, Ranch Dressing",
        "price": "\$10.99",
        "imageUrl":
            "https://images.pexels.com/photos/6004341/pexels-photo-6004341.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
    ],
    "Soups": [
      {
        "title": "Tomato Soup",
        "description": "Fresh tomato soup served with basil and cream.",
        "ingredients": "Tomato, Basil, Cream",
        "price": "\$5.99",
        "imageUrl":
            "https://images.pexels.com/photos/1352298/pexels-photo-1352298.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
      {
        "title": "Chicken Noodle Soup",
        "description": "Warm soup with chicken, noodles, and vegetables.",
        "ingredients": "Chicken, Noodles, Carrots, Celery",
        "price": "\$6.99",
        "imageUrl":
            "https://images.pexels.com/photos/6004341/pexels-photo-6004341.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
    ],
    "Pizzas": [
      {
        "title": "Margherita Pizza",
        "description":
            "Classic pizza with tomato sauce, mozzarella, and fresh basil.",
        "ingredients": "Tomato, Mozzarella, Basil",
        "price": "\$9.99",
        "imageUrl":
            "https://images.pexels.com/photos/1352298/pexels-photo-1352298.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
      {
        "title": "Pepperoni Pizza",
        "description": "Spicy pepperoni on a mozzarella and tomato sauce base.",
        "ingredients": "Pepperoni, Mozzarella, Tomato Sauce",
        "price": "\$11.99",
        "imageUrl":
            "https://images.pexels.com/photos/6004341/pexels-photo-6004341.jpeg?auto=compress&cs=tinysrgb&w=400"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.receipt),
            onPressed: () => _showOrderList(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryFilter(),
          Expanded(child: _buildFilteredMenu()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: _selectedCategory,
        items: _categories.map((category) {
          return DropdownMenuItem(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedCategory = value!;
          });
        },
      ),
    );
  }

  Widget _buildFilteredMenu() {
    List<Map<String, dynamic>> filteredItems = [];

    // Filter by category
    if (_selectedCategory == 'All') {
      _menuData.forEach((category, items) {
        filteredItems.addAll(items);
      });
    } else {
      filteredItems = _menuData[_selectedCategory]!;
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      filteredItems = filteredItems
          .where((item) =>
              item['title']
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              item['description']
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return Card(
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
                  item['imageUrl'],
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
                      item['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(item['description']),
                    const SizedBox(height: 5),
                    Text(
                      "Ingredients: ${item['ingredients']}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Price: ${item['price']}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_isLoggedIn) {
                          _openOrderForm(context, item['title']);
                        } else {
                          _showLoginPrompt(context);
                        }
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

  void _openOrderForm(BuildContext context, String itemTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order for $itemTitle'),
          content: OrderForm(itemTitle: itemTitle),
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
    ).then((order) {
      if (order != null && order is Order) {
        setState(() {
          _orders.add(order);
        });
      }
    });
  }

  void _showOrderList(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Orders'),
          content: _orders.isEmpty
              ? const Text('You have not ordered anything yet.')
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _orders.map((order) {
                    return ListTile(
                      title: Text(order.item),
                      subtitle: Text('Quantity: ${order.quantity}'),
                    );
                  }).toList(),
                ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showLoginPrompt(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Required'),
          content: const Text(
              'Please log in to continue. Do you want to log in or sign up now?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement login/signup logic here
                _redirectToLogin(context);
              },
              child: const Text('Log In / Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _redirectToLogin(BuildContext context) {
    // Implement redirection to the login page
    print('Redirecting to login/signup...');
    // You can navigate to the login page here
  }
}

class OrderForm extends StatefulWidget {
  final String itemTitle;

  const OrderForm({super.key, required this.itemTitle});

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: _quantityController,
          decoration: const InputDecoration(labelText: 'Quantity'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            final quantity = int.tryParse(_quantityController.text);
            if (quantity != null) {
              Navigator.of(context).pop(Order(
                item: widget.itemTitle,
                quantity: quantity,
              ));
            }
          },
          child: const Text('Submit Order'),
        ),
      ],
    );
  }
}

class Order {
  final String item;
  final int quantity;

  Order({required this.item, required this.quantity});
}
