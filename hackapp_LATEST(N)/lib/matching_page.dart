import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({super.key});

  @override
  State<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  final List<SwipeItem> _swipeItems = [];
  MatchEngine? _matchEngine;

  final List<Map<String, String>> users = [
    {"name": "Alice", "image": "lib/pics/alice.jpg"},
    {"name": "Bob", "image": "lib/pics/Bob.jpg"},
    {"name": "Charlie", "image": "lib/pics/Charlie.jpg"},
    {"name": "Diana", "image": "lib/pics/Diana.jpg"},
    {"name": "Eve", "image": "lib/pics/Eve.jpg"},
    {"name": "Frank", "image": "lib/pics/Frank.jpg"},
    {"name": "Grace", "image": "lib/pics/Grace.jpg"},
    {"name": "Hank", "image": "lib/pics/Hank.jpg"},
  ];

  @override
  void initState() {
    super.initState();

    for (var user in users) {
      _swipeItems.add(
        SwipeItem(
          content: user,
          likeAction: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Liked ${user['name']}!"),
              duration: const Duration(seconds: 1),
            ),
          ),
          nopeAction: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Skipped ${user['name']}."),
              duration: const Duration(seconds: 1),
            ),
          ),
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find a Roommate')),
      body: Stack(
        children: [
          // ✅ Background logo with light opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.07, // Adjust as needed
              child: Image.asset(
                'lib/pics/Logo.jpg', // Path to your logo image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ✅ Foreground swipe cards or "No more users"
          Center(
            child: _swipeItems.isNotEmpty
                ? SwipeCards(
                    matchEngine: _matchEngine!,
                    itemBuilder: (context, index) {
                      final user = _swipeItems[index].content as Map<String, String>;
                      return Card(
                        margin: const EdgeInsets.all(16),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                              child: Image.asset(
                                user['image']!,
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.person, size: 120),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              user['name']!,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                    onStackFinished: () {
                      setState(() {
                        _swipeItems.clear(); // Trigger "No more users!" state
                      });
                    },
                  )
                : const Center(
                    child: Text(
                      "No more users!",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}