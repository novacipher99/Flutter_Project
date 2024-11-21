
import 'package:flutter/material.dart';
import 'package:food_recipe_app/sign_in_screen.dart';
// Import the SignInPage or SignUpPage

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  // Controllers for text fields
  final TextEditingController nameController =
      TextEditingController(text: 'SHIVAM KUMAR');
  final TextEditingController emailController =
      TextEditingController(text: 's.kumar00@rku.ac.in');
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController favoriteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.popUntil(
                  context, (route) => route.isFirst); // Go back to home
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/profile_placeholder.jpg'),
            ),
            const SizedBox(height: 20),
            // Editable Name Field
            TextFormField(
              controller: nameController,
              enabled: isEditing, // Editable only if in edit mode
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            // Editable Email Field
            TextFormField(
              controller: emailController,
              enabled: isEditing, // Editable only if in edit mode
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            // Editable About Field
            TextFormField(
              controller: aboutController,
              enabled: isEditing, // Editable only if in edit mode
              decoration: const InputDecoration(
                labelText: 'About',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            // Editable Favorite Field
            TextFormField(
              controller: favoriteController,
              enabled: isEditing, // Editable only if in edit mode
              decoration: const InputDecoration(
                labelText: 'Favorite',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            // Toggle Edit Profile Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = !isEditing; // Toggle editing mode
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isEditing ? Colors.blue : Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  isEditing ? 'Save' : 'Edit Profile',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                // Redirect to SignIn or SignUp page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SignInScreen()), // Replace with your SignInPage or SignUpPage
                  (route) =>
                      false, // Removes all previous routes to prevent back navigation to Profile
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
