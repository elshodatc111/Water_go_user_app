import 'package:flutter/material.dart';
import 'package:watergo_user/sccren/home/map_page.dart';
import 'package:watergo_user/sccren/home/show_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo2.png',
          height: 24,
        ),
        backgroundColor: const Color(0xff279FDA),
        actions: [
          MapButton(),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Cards(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowPage()),
              );
            },
          );
        },
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final VoidCallback onTap;

  const Cards({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xffffffff),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/logo1.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 8,
                  left: 8,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        size: 16,
                        color: Colors.amberAccent,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '4.9 (412)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.heart_broken_sharp,
                    size: 16,
                    color: Colors.amberAccent,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Suv Fermasi Nomi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Narxi: 12 000 so'm",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MapButton extends StatelessWidget {
  const MapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MapPage()),
        );
      },
      child: const Row(
        children: [
          Icon(
            Icons.location_on,
            size: 28.0,
            color: Color(0xffffffff),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buyurtma manzili',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xffB2EBF2),
                ),
              ),
              Text(
                'Qarshi shaxar navo MFI 15/52 uy',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xffB2EBF2),
                ),
              ),
            ],
          ),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
