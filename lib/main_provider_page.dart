import 'package:flutter/material.dart';
import 'package:flutter_app_course/controllers/main_provider.dart';
import 'package:provider/provider.dart';

class MainProviderPage extends StatelessWidget {
  const MainProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var indexSelected = context.watch<MainProvider>().tabSelected;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: bodyTabSelected(indexSelected),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexSelected,
          onTap: (value) {
            context.read<MainProvider>().changeTabSelected(value);
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

  Widget bodyTabSelected(int index) {
    switch (index) {
      case 0:
        return const Center(
          child: Text('Home Page (Provider)'),
        );
      case 1:
        return const Center(
          child: Text('Favorite Page (Provider)'),
        );
      case 2:
        return const Center(
          child: Text('My Profile Page (Provider)'),
        );
      default:
        return const SizedBox();
    }
  }
}