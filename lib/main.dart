import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const RestaurantMenuScreen(),
    );
  }
}

// Food data model
class FoodItem {
  final String name;
  final String imagePath;
  final String description;
  final String price;

  const FoodItem({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}

// Main restaurant menu screen
class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({super.key});

  final List<FoodItem> foodItems = const [
    FoodItem(
      name: 'Pizza',
      imagePath: 'assets/pizza.png',
      description:
          'Delicious cheesy pizza topped with fresh ingredients.',
      price: 'RM 12.90',
    ),
    FoodItem(
      name: 'Fried Chicken',
      imagePath: 'assets/Fried Chicken.png',
      description:
          'Crispy and juicy fried chicken served fresh and hot.',
      price: 'RM 10.90',
    ),
    FoodItem(
      name: 'Grilled Fish',
      imagePath: 'assets/Grill Fish.png',
      description:
          'Fresh grilled fish with a delicious smoky flavour.',
      price: 'RM 15.90',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),

      // App Bar
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),

      // Food Cards
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: foodItems.length,

        itemBuilder: (context, index) {
          final food = foodItems[index];

          return Card(
            elevation: 5,
            color: Colors.orange,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            margin: const EdgeInsets.only(bottom: 12),

            child: InkWell(
              borderRadius: BorderRadius.circular(15),

              // Navigate to food details
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FoodDetailScreen(foodItem: food);
                    },
                  ),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(12),

                child: Row(
                  children: [

                    // Food image
                    Container(
                      width: 100,
                      height: 100,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),

                        child: Image.asset(
                          food.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Food name
                    Expanded(
                      child: Text(
                        food.name,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Arrow
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Food detail screen
class FoodDetailScreen extends StatelessWidget {
  final FoodItem foodItem;

  const FoodDetailScreen({
    super.key,
    required this.foodItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // App Bar
      appBar: AppBar(
        title: Text(
          foodItem.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      // Food information
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Card(
            elevation: 5,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                children: [

                  // Large food image
                  Image.asset(
                    foodItem.imagePath,
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 25),

                  // Food name
                  Text(
                    foodItem.name,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Price
                  Text(
                    foodItem.price,

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description
                  Text(
                    foodItem.description,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}