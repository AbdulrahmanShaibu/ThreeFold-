import 'package:alhijra/theme/color.dart';
import 'package:alhijra/widgets/bottombar_item.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0;

  final List<IconData> _tapIcons = [
    Icons.home_rounded,
    Icons.explore_rounded,
    Icons.shopping_cart_rounded,
    Icons.person_rounded
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      bottomNavigationBar: _buildBottomBar(),
      body: _buildBarPage(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: .5,
            spreadRadius: .5,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          _tapIcons.length,
          (index) => BottomBarItem(
            _tapIcons[index],
            isActive: _activeTab == index,
            activeColor: primary,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBarPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _tapIcons.length,
        (index) => _pages[index],
      ),
    );
  }
}
