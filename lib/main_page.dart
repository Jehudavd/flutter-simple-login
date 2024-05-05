import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var tabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: bodyTabSelected(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabSelected,
          onTap: (value) {
            setState(() {
              tabSelected = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  size: 40,
                ),
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.star,
                  size: 40,
                ),
                icon: Icon(Icons.star),
                label: 'Favorite'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.portrait,
                  size: 40,
                ),
                icon: Icon(Icons.portrait),
                label: 'My Profile')
          ]),
    );
  }

  Widget bodyTabSelected() {
    switch (tabSelected) {
      case 0:
        return const Center(
          child: Text('Home Page'),
        );
      case 1:
        return const Center(
          child: Text('Favorite Page'),
        );
      case 2:
        return const Center(
          child: Text('My Profile Page'),
        );
      default:
        return const SizedBox();
    }
  }
}