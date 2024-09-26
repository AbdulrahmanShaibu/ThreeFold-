import 'package:alhijra/widgets/food_menu.dart';
import 'package:alhijra/widgets/hotels.dart';
import 'package:alhijra/widgets/rester.dart';
import 'package:alhijra/widgets/tour.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black,
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selectedCategory = false;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: _refreshContent,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _buildBody(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Zanzibar Tour",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.notifications,
            size: 28,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            // child: Text(
            //   "Explore Zanzibar",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
          ),
          const SizedBox(height: 25),
          _buildCategories(),
          const SizedBox(height: 10),
          _buildSearch(),
          const SizedBox(height: 25),
          _buildAdsImage(
              "https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg?auto=compress&cs=tinysrgb&w=400"),
          const SizedBox(height: 25),
          _buildTourImage(
              "https://images.pexels.com/photos/164336/pexels-photo-164336.jpeg?auto=compress&cs=tinysrgb&w=400"),
          const SizedBox(height: 25),
          _buildHotelImage(
              "https://images.pexels.com/photos/342800/pexels-photo-342800.jpeg?auto=compress&cs=tinysrgb&w=400"),
          const SizedBox(height: 20),
          _buildResterImage(
              "https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=400"),
          const SizedBox(height: 20),
          _buildSectionTitle("Popular Places"),
          const SizedBox(height: 5),
          _buildPopulars(),
          const SizedBox(height: 20),
          _buildSectionTitle("Featured Hotels"),
          const SizedBox(height: 10),
          _buildFeatured(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: const InputDecoration(
          hintText: "Search tours, hotels, restaurants...",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.filter_list, color: Colors.blueAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }

// for food order
  Widget _buildAdsImage(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodMenuPage()),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.fastfood, size: 18, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'About Food',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// for tour
  Widget _buildTourImage(String imageUrl) {
    return _buildCommonImage(imageUrl, 'About Tours', const TourMenuPage());
  }

// for hotel
  Widget _buildHotelImage(String imageUrl) {
    return _buildCommonImage(imageUrl, 'About Hotel', const HotelPage());
  }

// for rester
  Widget _buildResterImage(String imageUrl) {
    return _buildCommonImage(imageUrl, 'About Rester', const ResterPage());
  }

// Common widget for tour, hotel, and rester
  Widget _buildCommonImage(String imageUrl, String buttonText, Widget page) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.info,
                        size: 18,
                        color: Colors
                            .white), // You can customize the icon for each section
                    const SizedBox(width: 8),
                    Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryItem("Restaurants", Icons.restaurant, selectedCategory),
          _buildCategoryItem("Tours", Icons.map, selectedCategory),
          _buildCategoryItem("Accomodations", Icons.hotel, selectedCategory),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = !selectedCategory;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey[800]),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPopulars() {
    // Sample data for demonstration
    List<Map<String, dynamic>> popularPlaces = [
      {
        'imageUrl':
            'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&w=600',
        'name': 'Grand Canyon',
        'rating': 4.8,
        'description': 'A magnificent natural wonder.'
      },
      {
        'imageUrl':
            'https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&w=600',
        'name': 'Eiffel Tower',
        'rating': 4.7,
        'description': 'Iconic iron lattice tower in Paris.'
      },
      {
        'imageUrl':
            'https://images.pexels.com/photos/2869215/pexels-photo-2869215.jpeg?auto=compress&cs=tinysrgb&w=600',
        'name': 'Grand Canyon',
        'rating': 4.8,
        'description': 'A magnificent natural wonder.'
      },
      {
        'imageUrl':
            'https://images.pexels.com/photos/2507010/pexels-photo-2507010.jpeg?auto=compress&cs=tinysrgb&w=600',
        'name': 'Eiffel Tower',
        'rating': 4.7,
        'description': 'Iconic iron lattice tower in Paris.'
      },
      // Add more places as needed
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularPlaces.length,
        itemBuilder: (context, index) {
          return _buildPopularItem(
            popularPlaces[index]['imageUrl'],
            popularPlaces[index]['name'],
            popularPlaces[index]['rating'],
            popularPlaces[index]['description'],
          );
        },
      ),
    );
  }

  Widget _buildPopularItem(
      String imageUrl, String name, double rating, String description) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background image
            Image.network(
              imageUrl,
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            // Overlay for better text visibility
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Column for place details
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.yellow),
                      const SizedBox(width: 2),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatured() {
    // You can replace this with your list of featured hotels
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildFeaturedItem(
            'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600',
            'Luxury Hotel',
            4.5,
            'New York, NY',
            '\$200 per night',
          );
        },
      ),
    );
  }

  Widget _buildFeaturedItem(String imageUrl, String hotelName, double rating,
      String location, String price) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background image
            Image.network(
              imageUrl,
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            // Overlay to improve text visibility
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Column for hotel details
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotelName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.yellow),
                      const SizedBox(width: 2),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshContent() async {
    // Simulate a delay for the refresh
    await Future.delayed(const Duration(seconds: 2));
  }
}
