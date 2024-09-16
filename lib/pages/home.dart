import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
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
            "Znzibat Tour App",
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
              "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&w=400"),
          const SizedBox(height: 25),
          _buildAdsImage(
              "https://images.pexels.com/photos/1295036/pexels-photo-1295036.jpeg?auto=compress&cs=tinysrgb&w=400"),
          const SizedBox(height: 25),
          _buildAdsImage(
              "https://images.pexels.com/photos/3434562/pexels-photo-3434562.jpeg?auto=compress&cs=tinysrgb&w=400"),
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
                'View More',
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
          // ignore: deprecated_member_use
          _buildCategoryItem("All", FontAwesomeIcons.th, true),
          _buildCategoryItem("Food", FontAwesomeIcons.utensils, false),
          _buildCategoryItem("Tours", FontAwesomeIcons.route, false),
          _buildCategoryItem("Hotels", FontAwesomeIcons.hotel, false),
          _buildCategoryItem(
              // ignore: deprecated_member_use
              "Restaurants", FontAwesomeIcons.wineGlassAlt, false),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.blueAccent : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
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
    );
  }

  Widget _buildPopulars() {
    // Populate with popular tours or places data
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          _buildPopularItem("Nungwi Beach",
              "https://images.pexels.com/photos/1699574/pexels-photo-1699574.jpeg?auto=compress&cs=tinysrgb&w=400"),
          _buildPopularItem("Stone Town",
              "https://images.pexels.com/photos/4319885/pexels-photo-4319885.jpeg?auto=compress&cs=tinysrgb&w=400"),
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
    // Populate with featured hotels or services data
    return Column(
      children: [
        _buildFeaturedItem(
            "Park Hyatt Zanzibar", "https://images.pexels.com/photos/261186/pexels-photo-261186.jpeg?auto=compress&cs=tinysrgb&w=400"),
        _buildFeaturedItem("The Residence Zanzibar",
            "https://images.pexels.com/photos/4321464/pexels-photo-4321464.jpeg?auto=compress&cs=tinysrgb&w=400"),
      ],
    );
  }

  Widget _buildFeaturedItem(String name, String imageUrl) {
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
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                // Add your action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 140, 164, 241),
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
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
