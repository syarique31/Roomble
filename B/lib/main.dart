import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_cards/swipe_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roomate Finder',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: LoginPage(title: 'Roomate Finder'),

    );
  }
}

////come here
// class LoginPage extends StatelessWidget {
//   final String title; // Add title property
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   LoginPage({super.key, required this.title}); // Add a required title parameter

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Validate email and password
//                 if (emailController.text.isNotEmpty &&
//                     passwordController.text.isNotEmpty) {
//                   // Navigate to HomePage
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const HomePage()),
//                   );
//                 } else {
//                   // Show error message if fields are empty
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Please fill in all fields')),
//                   );
//                 }
//               },
//               child: Text('Login'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegistrationPage()),
//                 );
//               },
//               child: Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  final String title;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/pics/Logo.jpg', // Path to your image
              fit: BoxFit.cover, // Cover the screen
            ),
          ),
          // Login form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill in all fields')),
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationPage()),
                      );
                    },
                    child: const Text('Sign Up'),
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

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();

  
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController programController = TextEditingController();
//   final TextEditingController hobbiesController = TextEditingController();

//   String selectedGender = 'Male'; // Default gender
//   String selectedHall = 'Adelaide Hall'; // Default hall
//   String selectedPreference = 'Quiet'; // Default roommate preference
  
 

//   Future<void> saveProfile() async {
//     log('Save Profile button clicked'); // Add this to confirm execution
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString('name', nameController.text);
//   await prefs.setString('program', programController.text);
//   await prefs.setString('hobbies', hobbiesController.text);
//   await prefs.setString('gender', selectedGender);
//   await prefs.setString('hall', selectedHall);
//   await prefs.setString('preference', selectedPreference);

//   // Check if the widget is still mounted before using context
//   if (mounted) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Profile saved successfully!')),
//     );

//     // Navigate to HomePage
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const HomePage()),
//     );

    
//   }
// }

//   Future<void> loadProfile() async {
//   final prefs = await SharedPreferences.getInstance();
//   final name = prefs.getString('name') ?? '';
//   final program = prefs.getString('program') ?? '';
//   final hobbies = prefs.getString('hobbies') ?? '';
//   final gender = prefs.getString('gender') ?? '';
//   final hall = prefs.getString('hall') ?? '';
//   final preference = prefs.getString('preference') ?? '';

//   log('Name: $name');
//   log('Program: $program');
//   log('Hobbies: $hobbies');
//   log('Gender: $gender');
//   log('Hall: $hall');
//   log('Preference: $preference');
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Name Field
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Program Field
//               TextField(
//                 controller: programController,
//                 decoration: const InputDecoration(
//                   labelText: 'Program',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Hobbies/Interests Field
//               TextField(
//                 controller: hobbiesController,
//                 decoration: const InputDecoration(
//                   labelText: 'Hobbies/Interests',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Gender Dropdown
//               const Text('Gender'),
//               DropdownButton<String>(
//                 value: selectedGender,
//                 items: ['Male', 'Female', 'Other'].map((gender) {
//                   return DropdownMenuItem(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedGender = value!;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Updated Hall Dropdown
//               const Text('Hall to Live'),
//               DropdownButton<String>(
//                 value: selectedHall,
//                 items: [
//                   'Adelaide Hall',
//                   'Ban Righ Hall',
//                   'Brant House',
//                   'Chown Hall',
//                   'David C. Smith House',
//                   'Endaayaan – Tkanónsote',
//                   'Gordon Brockington House',
//                   'Harkness Hall',
//                   'Jean Royce Hall',
//                   'John Deutsch University Centre (JDUC)',
//                   'Leggett Hall',
//                   'Leonard Hall',
//                   'McNeill House',
//                   'Morris Hall',
//                   'Victoria Hall',
//                   'Waldron Tower',
//                   'Watts Hall'
//                 ].map((hall) {
//                   return DropdownMenuItem(
//                     value: hall,
//                     child: Text(hall),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedHall = value!;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Roommate Preference Dropdown
//               const Text('Roommate Preference'),
//               DropdownButton<String>(
//                 value: selectedPreference,
//                 items: ['Quiet', 'Outgoing', 'Flexible'].map((preference) {
//                   return DropdownMenuItem(
//                     value: preference,
//                     child: Text(preference),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedPreference = value!;
//                   });
//                 },
//               ),
//               const SizedBox(height: 32),

//               // Save Button
//               ElevatedButton(
//                 onPressed: saveProfile, 
//                   // // Print or Save Profile Data
//                   // log('Name: ${nameController.text}');
//                   // log('Program: ${programController.text}');
//                   // log('Hobbies: ${hobbiesController.text}');
//                   // log('Gender: $selectedGender');
//                   // log('Hall: $selectedHall');
//                   // log('Preference: $selectedPreference');
                
//                 child: const Text('Save Profile'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

////aboveeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();

  String selectedGender = 'Male'; // Default gender
  String selectedHall = 'Adelaide Hall'; // Default hall
  String selectedPreference = 'Quiet'; // Default roommate preference

  Future<void> saveProfile() async {
    log('Save Profile button clicked'); // Add this to confirm execution
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('program', programController.text);
    await prefs.setString('hobbies', hobbiesController.text);
    await prefs.setString('gender', selectedGender);
    await prefs.setString('hall', selectedHall);
    await prefs.setString('preference', selectedPreference);

    // Check if the widget is still mounted before using context
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully!')),
      );

      // Navigate to HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/pics/Logo.jpg'), // Path to your background image
            fit: BoxFit.cover, // Ensures the image covers the whole background
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white70, // Make text field stand out
                  ),
                ),
                const SizedBox(height: 16),

                // Program Field
                TextField(
                  controller: programController,
                  decoration: const InputDecoration(
                    labelText: 'Program',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),

                // Hobbies/Interests Field
                TextField(
                  controller: hobbiesController,
                  decoration: const InputDecoration(
                    labelText: 'Hobbies/Interests',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),

                // Gender Dropdown
                const Text('Gender'),
                DropdownButton<String>(
                  value: selectedGender,
                  items: ['Male', 'Female', 'Other'].map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Hall Dropdown
                const Text('Hall to Live'),
                DropdownButton<String>(
                  value: selectedHall,
                  items: [
                    'Adelaide Hall',
                    'Ban Righ Hall',
                    'Brant House',
                    'Chown Hall',
                    'David C. Smith House',
                    'Endaayaan – Tkanónsote',
                    'Gordon Brockington House',
                    'Harkness Hall',
                    'Jean Royce Hall',
                    'John Deutsch University Centre (JDUC)',
                    'Leggett Hall',
                    'Leonard Hall',
                    'McNeill House',
                    'Morris Hall',
                    'Victoria Hall',
                    'Waldron Tower',
                    'Watts Hall',
                  ].map((hall) {
                    return DropdownMenuItem(
                      value: hall,
                      child: Text(hall),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedHall = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Roommate Preference Dropdown
                const Text('Roommate Preference'),
                DropdownButton<String>(
                  value: selectedPreference,
                  items: ['Quiet', 'Outgoing', 'Flexible'].map((preference) {
                    return DropdownMenuItem(
                      value: preference,
                      child: Text(preference),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPreference = value!;
                    });
                  },
                ),
                const SizedBox(height: 32),

                // Save Button
                Center(
                  child: ElevatedButton(
                    onPressed: saveProfile,
                    child: const Text('Save Profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   final _formKey = GlobalKey<FormState>(); // To validate the form

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Email Field
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Password Field
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   } else if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Confirm Password Field
//               TextFormField(
//                 controller: confirmPasswordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Confirm Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm your password';
//                   } else if (value != passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 32),

//               // Sign Up Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Navigate to ProfilePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ProfilePage()),
//                       );
//                     }
//                   },
//                   child: const Text('Sign Up'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // To validate the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/pics/Logo.jpg', // Path to your image
              fit: BoxFit.cover,
            ),
          ),
          // Sign-up form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()),
                          );
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Default to Chat Page

  // Pages for each tab
  final List<Widget> _pages = [
    const ChatPage(),
    const MatchingPage(),
    const AiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0
              ? "Chat"
              : _currentIndex == 1
                  ? "Matching"
                  : "AI",
        ),
        automaticallyImplyLeading: false, // Remove back arrow
      ),
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update index for navigation
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Matching',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'AI',
          ),
        ],
      ),
    );
  }
}

// Define ChatPage
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Chat Page",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Define MatchingPage    to go back toooooooooooooooooooooooooooooooooooooooooooooooooooo
// class MatchingPage extends StatelessWidget {
//   const MatchingPage({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         "Matching Page",
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }

// class MatchingPage extends StatefulWidget {
//   const MatchingPage({super.key});

//   @override
//   State<MatchingPage> createState() => _MatchingPageState();
// }

// class _MatchingPageState extends State<MatchingPage> {
//   final List<SwipeItem> _swipeItems = [];
//   MatchEngine? _matchEngine;

//   // Add the list of user data here
//   List<Map<String, String>> users = [
//   {"name": "Alice", "image": "lib/pics/alice.jpg"},
//   {"name": "Bob", "image": "lib/pics/Bob.jpg"},
//   {"name": "Charlie", "image": "lib/pics/Charlie.jpg"},
//   {"name": "Diana", "image": "lib/pics/Diana.jpg"},
//   {"name": "Eve", "image": "lib/pics/Eve.jpg"},
//   {"name": "Frank", "image": "lib/pics/Frank.jpg"},
//   {"name": "Grace", "image": "lib/pics/Grace.jpg"},
//   {"name": "Hank", "image": "lib/pics/Hank.jpg"},
//   {"name": "Ivy", "image": "lib/pics/Ivy.jpg"},
//   {"name": "Jack", "image": "lib/pics/Jack.jpg"},
// ];

//   @override
//   void initState() {
//     super.initState();

//     // Populate swipe items using the users list
//     for (var user in users) {
//       _swipeItems.add(
//         SwipeItem(
//           content: user,
//           likeAction: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("You liked ${user['name']}!")),
//             );
//           },
//           nopeAction: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("You ignored ${user['name']}.")),
//             );
//           },
//         ),
//       );
//     }

//     // Initialize the match engine
//     _matchEngine = MatchEngine(swipeItems: _swipeItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Matching Page'),
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: SwipeCards(
//                 matchEngine: _matchEngine!,
//                 itemBuilder: (context, index) {
//                   final user = _swipeItems[index].content as Map<String, String>;
//                   return Card(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(user['image']!, height: 300, fit: BoxFit.cover),
//                         const SizedBox(height: 16),
//                         Text(user['name']!, style: const TextStyle(fontSize: 24)),
//                       ],
//                     ),
//                   );
//                 },
//                 onStackFinished: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("No more users!")),
//                   );
//                 },
//                 upSwipeAllowed: false,
//                 fillSpace: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MatchingPage extends StatefulWidget {
//   const MatchingPage({super.key});

//   @override
//   State<MatchingPage> createState() => _MatchingPageState();
// }

// class _MatchingPageState extends State<MatchingPage> {
//   final List<SwipeItem> _swipeItems = [];
//   MatchEngine? _matchEngine;

//   // Add the list of user data here
//   List<Map<String, String>> users = [
//     {"name": "Alice", "image": "lib/pics/alice.jpg"},
//     {"name": "Bob", "image": "lib/pics/Bob.jpg"},
//     {"name": "Charlie", "image": "lib/pics/Charlie.jpg"},
//     {"name": "Diana", "image": "lib/pics/Diana.jpg"},
//     {"name": "Eve", "image": "lib/pics/Eve.jpg"},
//     {"name": "Frank", "image": "lib/pics/Frank.jpg"},
//     {"name": "Grace", "image": "lib/pics/Grace.jpg"},
//     {"name": "Hank", "image": "lib/pics/Hank.jpg"},
//     {"name": "Ivy", "image": "lib/pics/Ivy.jpg"},
//     {"name": "Jack", "image": "lib/pics/Jack.jpg"},
//   ];

//   @override
//   void initState() {
//     super.initState();

//     // Populate swipe items using the users list
//     for (var user in users) {
//       _swipeItems.add(
//         SwipeItem(
//           content: user,
//           likeAction: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("You liked ${user['name']}!")),
//             );
//           },
//           nopeAction: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("You ignored ${user['name']}.")),
//             );
//           },
//         ),
//       );
//     }

//     // Initialize the match engine
//     _matchEngine = MatchEngine(swipeItems: _swipeItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Matching Page'),
//         automaticallyImplyLeading: false,
//       ),
//       body: Container(
//         alignment: Alignment.center, // Center the cards
//         padding: const EdgeInsets.all(16), // Add padding for better alignment
//         child: SwipeCards(
//           matchEngine: _matchEngine!,
//           itemBuilder: (context, index) {
//             final user = _swipeItems[index].content as Map<String, String>;
//             return Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20), // Rounded corners
//               ),
//               elevation: 4, // Shadow
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     user['image']!,
//                     height: 300,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     user['name']!,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           onStackFinished: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("No more users!")),
//             );
//           },
//           upSwipeAllowed: false,
//           fillSpace: false, // Avoid stretching cards to fill space
//         ),
//       ),
//     );
//   }
// }

////////ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
// class MatchingPage extends StatefulWidget {
//   const MatchingPage({super.key});

//   @override
//   State<MatchingPage> createState() => _MatchingPageState();
// }

// class _MatchingPageState extends State<MatchingPage> {
//   final List<SwipeItem> _swipeItems = [];
//   MatchEngine? _matchEngine;

//   // Add the list of user data here
//   List<Map<String, String>> users = [
//     {"name": "Alice", "image": "lib/pics/alice.jpg"},
//     {"name": "Bob", "image": "lib/pics/Bob.jpg"},
//     {"name": "Charlie", "image": "lib/pics/Charlie.jpg"},
//     {"name": "Diana", "image": "lib/pics/Diana.jpg"},
//     {"name": "Eve", "image": "lib/pics/Eve.jpg"},
//     {"name": "Frank", "image": "lib/pics/Frank.jpg"},
//     {"name": "Grace", "image": "lib/pics/Grace.jpg"},
//     {"name": "Hank", "image": "lib/pics/Hank.jpg"},
//     {"name": "Ivy", "image": "lib/pics/Ivy.jpg"},
//     {"name": "Jack", "image": "lib/pics/Jack.jpg"},
//   ];

//   @override
//   void initState() {
//     super.initState();

//     // Populate swipe items using the users list
//     for (var user in users) {
//       _swipeItems.add(
//         SwipeItem(
//           content: user,
//           likeAction: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("You liked ${user['name']}!")),
//             );
//           },
//           nopeAction: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("You ignored ${user['name']}.")),
//             );
//           },
//         ),
//       );
//     }

//     // Initialize the match engine
//     _matchEngine = MatchEngine(swipeItems: _swipeItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Matching Page'),
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16), // Add padding around the content
//           child: SwipeCards(
//             matchEngine: _matchEngine!,
//             itemBuilder: (context, index) {
//               final user = _swipeItems[index].content as Map<String, String>;
//               return SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8, // Set the card width to 80% of the screen
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20), // Rounded corners
//                   ),
//                   elevation: 4, // Shadow
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         user['image']!,
//                         height: 300,
//                         fit: BoxFit.cover,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         user['name']!,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             onStackFinished: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("No more users!")),
//               );
//             },
//             upSwipeAllowed: false,
//             fillSpace: false, // Avoid stretching cards to fill space
//           ),
//         ),
//       ),
//     );
//   }
// }
class MatchingPage extends StatefulWidget {
  const MatchingPage({super.key});

  @override
  State<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  final List<SwipeItem> _swipeItems = [];
  MatchEngine? _matchEngine;

  // Add the list of user data here
  List<Map<String, String>> users = [
    {"name": "Alice", "image": "lib/pics/alice.jpg"},
    {"name": "Bob", "image": "lib/pics/Bob.jpg"},
    {"name": "Charlie", "image": "lib/pics/Charlie.jpg"},
    {"name": "Diana", "image": "lib/pics/Diana.jpg"},
    {"name": "Eve", "image": "lib/pics/Eve.jpg"},
    {"name": "Frank", "image": "lib/pics/Frank.jpg"},
    {"name": "Grace", "image": "lib/pics/Grace.jpg"},
    {"name": "Hank", "image": "lib/pics/Hank.jpg"},
    {"name": "Ivy", "image": "lib/pics/Ivy.jpg"},
    {"name": "Jack", "image": "lib/pics/Jack.jpg"},
  ];

  @override
  void initState() {
    super.initState();

    // Populate swipe items using the users list
    for (var user in users) {
      _swipeItems.add(
        SwipeItem(
          content: user,
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You liked ${user['name']}!")),
            );
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You ignored ${user['name']}.")),
            );
          },
        ),
      );
    }

    // Initialize the match engine
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100], // Match the background
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            const Icon(Icons.home, color: Colors.blue), // Home icon
            const SizedBox(width: 8),
            Text(
              "Roombie",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.lightBlue[100], // Light blue background
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (context, index) {
                  final user = _swipeItems[index].content as Map<String, String>;
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8, // Width
                      child: Card(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  user['image']!,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                user['name']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                onStackFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No more users!")),
                  );
                },
                upSwipeAllowed: false,
                fillSpace: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MatchingPage extends StatelessWidget {
//   const MatchingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Matching Page"),
//       ),
//       body: Center(
//         child: Image.asset(
//           'lib/pics/alice.jpg', // Path to your test image
//           height: 300,          // Adjust height as needed
//           fit: BoxFit.cover,    // Ensure it fits well
//         ),
//       ),
//     );
//   }
// }

class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Features'),
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      body: const Center(
        child: Text(
          'Welcome to the AI Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}