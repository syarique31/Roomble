import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'matching_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roommate Finder',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) {
          final userEmail = ModalRoute.of(context)!.settings.arguments as String;
          return HomePage(userEmail: userEmail);
        },
        '/matching': (context) => const MatchingPage(),
      },
    );
  }
}