import 'package:flutter/material.dart';
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buyurtmalar tarixi',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: const Color(0xff279FDA),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Text("Buyurtmalar tarixi"),
      ),
    );
  }
}
