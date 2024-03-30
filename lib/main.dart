import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(color: Colors.blue, elevation: 0),
        iconTheme: const IconThemeData(color: Colors.blue, size: 28),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 7,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavigationBarItem> _bottomNavigationBarItemList = const [
    BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Parties'),
    BottomNavigationBarItem(
        icon: Icon(Icons.my_library_books_rounded), label: 'Bills'),
    BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard_rounded), label: 'Items'),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_rounded), label: 'Loans'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_rounded), label: 'More'),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.book),
        title: const Text(
          'My Business',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        actions: const [Icon(Icons.perm_contact_calendar), SizedBox(width: 8)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        items: _bottomNavigationBarItemList,
        currentIndex: _currentIndex,
        onTap: (int? val) {
          _currentIndex = val!;
          setState(() {});
        },
      ),
      body: const HomeScreen(),
    );
  }
}
