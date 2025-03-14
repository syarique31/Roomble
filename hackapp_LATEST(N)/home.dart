import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String? userEmail;

  const HomePage({super.key, this.userEmail});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String? ?? userEmail ?? "User";

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Stack(
        children: [
          // ✅ Background Logo (light opacity)
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Image.asset(
                'lib/pics/Logo.jpg', // Adjust path if needed
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ✅ Foreground content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome, $email!",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/matching');
                  },
                  child: const Text("Find a Roommate"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}