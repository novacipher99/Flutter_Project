
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'recipe_screen.dart'; // Import RecipeScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Popular';

  // Fetch recipes based on selected category
  List<Map<String, dynamic>> getCategoryRecipes() {
    switch (selectedCategory) {
      case 'Western':
        return westernRecipes;
      case 'Veg':
        return vegRecipes;
      case 'Non-Veg':
        return nonVegRecipes;
      default:
        return popularRecipes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/profile_placeholder.jpg'),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Shivam',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const Text(
                'Make your own food',
                style: TextStyle(color: Colors.yellow, fontSize: 24),
              ),
              const SizedBox(height: 20),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search your favourite food recipe',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    suffixIcon: Icon(Icons.filter_list, color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Category Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCategoryButton('Popular'),
                  buildCategoryButton('Western'),
                  buildCategoryButton('Veg'),
                  buildCategoryButton('Non-Veg'),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '$selectedCategory RECIPES',
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              const SizedBox(height: 10),
              // Recipe Grid based on selected category
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getCategoryRecipes().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final recipe = getCategoryRecipes()[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(
                            recipeTitle: recipe['name'],
                            recipeImage: recipe['image'],
                            ingredients: const [
                              'Ingredient 1',
                              'Ingredient 2',
                              'Ingredient 3'
                            ], // Dummy Ingredients
                            directions: 'Cook it for 20 minutes',
                            description:
                                "it's very healthy", // Dummy Directions
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              recipe['image'],
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe['name'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(Icons.local_fire_department,
                                        color: Colors.orange, size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${recipe['calories']} cal',
                                      style: const TextStyle(
                                          color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build category buttons for Popular, Western, Veg, and Non-Veg
  Widget buildCategoryButton(String category) {
    bool isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: isSelected ? Colors.yellow : Colors.white10,
            child: Icon(
              Icons.local_fire_department,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.yellow : Colors.white70,
              fontSize: isSelected ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }
}

// Updated Data for Popular Recipes
List<Map<String, dynamic>> popularRecipes = [
  {
    'name': 'Paneer Butter Masala',
    'calories': 250,
    'image': 'assets/images/paneer.png'
  },
  {'name': 'Burger', 'calories': 450, 'image': 'assets/images/burger.png'},
  {'name': 'Salad', 'calories': 500, 'image': 'assets/images/salad.png'},
  {'name': 'Fish Fry', 'calories': 300, 'image': 'assets/images/pizza.png'},
  {'name': 'Chicken', 'calories': 350, 'image': 'assets/images/chicken.png'},
  {'name': 'Fish Fry', 'calories': 400, 'image': 'assets/images/fish.png'},
];

// Updated Data for Western Recipes
List<Map<String, dynamic>> westernRecipes = [
  {
    'name': 'Veggie Burger',
    'calories': 320,
    'image': 'assets/images/burger.png'
  },
  {
    'name': 'Cheeseburger',
    'calories': 500,
    'image': 'assets/images/cheeseburger.png'
  },
  {'name': 'Pizza', 'calories': 600, 'image': 'assets/images/pizza.png'},
  {
    'name': 'Bacon Burger',
    'calories': 700,
    'image': 'assets/images/bacon_burger.png'
  },
  {
    'name': 'Chicken Nuggets',
    'calories': 350,
    'image': 'assets/images/nuggets.png'
  },
  {'name': 'French Fries', 'calories': 450, 'image': 'assets/images/fries.png'},
  {
    'name': 'Fish and Chips',
    'calories': 550,
    'image': 'assets/images/fish_and_chips.png'
  },
  {'name': 'Pasta', 'calories': 500, 'image': 'assets/images/pasta.png'},
];

// Updated Data for Veg Recipes
List<Map<String, dynamic>> vegRecipes = [
  {
    'name': 'Palak Paneer',
    'calories': 300,
    'image': 'assets/images/palak_paneer.png'
  },
  {
    'name': 'Dal Makhani',
    'calories': 350,
    'image': 'assets/images/dal_makhani.png'
  },
  {
    'name': 'Aloo Gobi',
    'calories': 250,
    'image': 'assets/images/aloo_gobi.png'
  },
  {
    'name': 'Vegetable Pulao',
    'calories': 400,
    'image': 'assets/images/veg_pulao.png'
  },
  {
    'name': 'Chana Masala',
    'calories': 300,
    'image': 'assets/images/chana_masala.png'
  },
  {
    'name': 'Paneer Tikka',
    'calories': 450,
    'image': 'assets/images/paneer_tikka.png'
  },
  {'name': 'Veg Salad', 'calories': 150, 'image': 'assets/images/salad.png'},
  {
    'name': 'Aloo Tikki',
    'calories': 350,
    'image': 'assets/images/aloo_tikki.png'
  },
];

// Updated Data for Non-Veg Recipes
List<Map<String, dynamic>> nonVegRecipes = [
  {
    'name': 'Chicken Curry',
    'calories': 450,
    'image': 'assets/images/chicken.png'
  },
  {'name': 'Fish Curry', 'calories': 400, 'image': 'assets/images/fish.png'},
  {
    'name': 'Chicken Fry',
    'calories': 500,
    'image': 'assets/images/chicken_fry.png'
  },
  {
    'name': 'Mutton Biryani',
    'calories': 600,
    'image': 'assets/images/mutton_biryani.png'
  },
  {
    'name': 'Prawn Curry',
    'calories': 550,
    'image': 'assets/images/prawn_curry.png'
  },
  {
    'name': 'Chicken Tikka',
    'calories': 450,
    'image': 'assets/images/chicken_tikka.png'
  },
  {
    'name': 'Grilled Chicken',
    'calories': 350,
    'image': 'assets/images/grilled_chicken.png'
  },
  {'name': 'Fish Fry', 'calories': 400, 'image': 'assets/images/fish_fry.png'},
];
