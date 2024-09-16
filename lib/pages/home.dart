import 'package:alhijra/widgets/food_menu.dart';
import 'package:alhijra/widgets/hotels.dart';
import 'package:alhijra/widgets/rester.dart';
import 'package:alhijra/widgets/tour.dart';
import 'package:flutter/material.dart';
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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selectedCategory = false;

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
            "Znzibar Tour App",
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
            child: Text(
              "Explore Zanzibar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          _buildSearch(),
          const SizedBox(height: 25),
          _buildCategories(),
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
          _builResterImage(
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
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
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodMenuPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 5,
              ),
              child: const Text(
                'About Food',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TourMenuPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 5,
              ),
              child: const Text(
                'About Tours',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// for hotel
  Widget _buildHotelImage(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HotelPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 5,
              ),
              child: const Text(
                'About Hotel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // for rester
  Widget _builResterImage(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 5,
              ),
              child: const Text(
                'About Rester',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(
        children: [
          _buildCategoryItem("All", FontAwesomeIcons.th, true),
          _buildCategoryItem("Food", FontAwesomeIcons.utensils, false),
          _buildCategoryItem("Tours", FontAwesomeIcons.route, false),
          _buildCategoryItem("Hotels", FontAwesomeIcons.hotel, false),
          _buildCategoryItem(
              "Restaurants", FontAwesomeIcons.wineGlassAlt, false),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = !selectedCategory;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: Colors.blue.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: selected ? Colors.white : Colors.black),
            const SizedBox(width: 5),
            Text(
              name,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopulars() {
    return SizedBox(
      height: 160, // Set a fixed height for the slideshow
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPopularItem(
            "Nungwi Beach",
            "https://images.pexels.com/photos/1699574/pexels-photo-1699574.jpeg?auto=compress&cs=tinysrgb&w=400",
          ),
          _buildPopularItem(
            "Stone Town",
            "https://images.pexels.com/photos/4319885/pexels-photo-4319885.jpeg?auto=compress&cs=tinysrgb&w=400",
          ),
          _buildPopularItem(
            "Jozani Forest",
            "https://images.pexels.com/photos/1231232/pexels-photo-1231232.jpeg?auto=compress&cs=tinysrgb&w=400",
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItem(String name, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatured() {
    return Column(
      children: [
        _buildFeaturedItem(
            "Park Hyatt Zanzibar",
            "https://images.pexels.com/photos/261186/pexels-photo-261186.jpeg?auto=compress&cs=tinysrgb&w=400",
            4.5),
        _buildFeaturedItem(
            "The Residence Zanzibar",
            "https://images.pexels.com/photos/4321464/pexels-photo-4321464.jpeg?auto=compress&cs=tinysrgb&w=400",
            4.2),
      ],
    );
  }

  Widget _buildFeaturedItem(String name, String imageUrl, double rating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.yellow[700],
                  size: 18,
                );
              }),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                // Add your action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 5,
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Future<void> _refreshContent() async {
    // Add logic to refresh data from server or local storage
    setState(() {
      // Refresh the UI
    });
  }
}
