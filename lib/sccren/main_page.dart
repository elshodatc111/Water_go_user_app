import 'package:flutter/material.dart';
import 'package:watergo_user/sccren/home/home_page.dart';
import 'package:watergo_user/sccren/product/product_page.dart';
import 'package:watergo_user/sccren/profil/profil_page.dart';
import 'package:watergo_user/sccren/save/save_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SavePage(),
    const ProductPage(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xffB2EBF2),
        backgroundColor: const Color(0xFF279FDA),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken_sharp),
            label: 'Saqlangan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Buyurtmalar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}