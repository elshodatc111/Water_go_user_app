import 'package:flutter/material.dart';
import 'package:watergo_user/sccren/home/map_page.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  _BuyurtmaHaqidaPageState createState() => _BuyurtmaHaqidaPageState();
}

class _BuyurtmaHaqidaPageState extends State<ShowPage> {
  int selectedVolume = 1;
  int quantity = 1;

  final Map<int, int> prices = {
    1: 2000,
    5: 7000,
    10: 10000,
    20: 12000,
  };

  @override
  Widget build(BuildContext context) {
    int totalPrice = prices[selectedVolume]! * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buyurtma haqida',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: const Color(0xff279FDA),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.9 (415)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('Sevimli');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 16.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Sevimli',
                            style: TextStyle(
                              fontSize: 12,
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
            const SizedBox(height: 16),
            const Text(
              'Nike Shoes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Suv hajmi (L)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: prices.keys.map((volume) {
                return ChoiceChip(
                  label: Text('$volume L (${prices[volume]} so\'m)'),
                  selected: selectedVolume == volume,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedVolume = volume;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Buyurtma soni',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) {
                          quantity--;
                        }
                      });
                    },
                    icon: Icon(Icons.exposure_minus_1),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '$quantity',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: Icon(Icons.plus_one_outlined),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yetqazish manzili',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                    Text('Qarshi shaxari navo mfy'),
                  ],
                ),
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPage()),
                      );
                    },
                    icon: const Icon(Icons.location_on),
                  ),
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Buyurtma soni: $quantity');
                  debugPrint('Tanlangan suv hajmi: $selectedVolume L');
                  debugPrint('Umumiy narx: $totalPrice so\'m');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff279FDA),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  '($totalPrice so\'m) Buyurtma',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
