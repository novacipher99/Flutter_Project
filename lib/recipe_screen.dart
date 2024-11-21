
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final String recipeTitle;
  final String recipeImage;
  final List<String> ingredients;
  final String directions;
  final String description;

  const RecipeDetailPage({
    super.key,
    required this.recipeTitle,
    required this.recipeImage,
    required this.ingredients,
    required this.directions,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  recipeImage,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              recipeTitle,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            const Text(
              'Ingredients',
              style: TextStyle(color: Colors.yellow, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredients.map((ingredient) {
                return Text(
                  '- $ingredient',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Directions',
              style: TextStyle(color: Colors.yellow, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              directions,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(color: Colors.yellow, fontSize: 24),
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
