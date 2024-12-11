import 'package:flutter/material.dart';

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
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 16.0,
                      ),
                      onPressed: () {},
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Buyurtma soni:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                        icon: const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Container(
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
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
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
