import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6F4E37)),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class CoffeeItem {
  final String name;
  final String description;
  final String price;
  final String image;
  final IconData icon;

  const CoffeeItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.icon,
  });
}

const List<CoffeeItem> coffeeItems = [
  CoffeeItem(
    name: 'Espresso',
    description: 'Strong and rich single shot.',
    price: 'RM 6.00',
    image: 'assets/images/espresso.jpg',
    icon: Icons.local_cafe,
  ),
  CoffeeItem(
    name: 'Latte',
    description: 'Smooth espresso with steamed milk.',
    price: 'RM 9.00',
    image: 'assets/images/latte.jpg',
    icon: Icons.local_cafe,
  ),
  CoffeeItem(
    name: 'Cappuccino',
    description: 'Espresso topped with thick milk foam.',
    price: 'RM 9.50',
    image: 'assets/images/cappucino.jpg',
    icon: Icons.local_cafe,
  ),
  CoffeeItem(
    name: 'Iced Americano',
    description: 'Espresso over ice and cold water.',
    price: 'RM 8.00',
    image: 'assets/images/icedamerican.jpg',
    icon: Icons.local_drink,
  ),
];

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EBDD),
      appBar: AppBar(
        title: const Text('Bean There Cafe'),
        backgroundColor: const Color(0xFF6F4E37),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Column(
              children: [
                Icon(Icons.coffee, size: 40, color: Color(0xFF6F4E37)),
                SizedBox(height: 8),
                Text(
                  'Our Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E2A1C),
                  ),
                ),
                Text('Freshly brewed, every day'),
              ],
            ),
          ),
          for (final item in coffeeItems) CoffeeCard(item: item),
        ],
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final CoffeeItem item;

  const CoffeeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Image.asset(item.image, width: 110, height: 110, fit: BoxFit.cover),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item.description),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(item.icon, size: 18, color: const Color(0xFF6F4E37)),
                      const SizedBox(width: 4),
                      Text(
                        item.price,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
