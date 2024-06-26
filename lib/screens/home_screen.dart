import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/select-contact/screen/contact_list_screen.dart';
import 'package:jp_book/screens/parties_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
        actions: [
          GestureDetector(
            child: const Icon(Icons.perm_contact_calendar),
            onTap: () {},
          ),
          const SizedBox(width: 8)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF800000),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => const ContactListScreen())));
        },
        label: const Text(
          'ADD CUSTOMER',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        unselectedItemColor: Colors.grey.shade600,
        selectedItemColor: Colors.blue,
        items: _bottomNavigationBarItemList,
        currentIndex: _currentIndex,
        onTap: (int? val) {
          _currentIndex = val!;
          setState(() {});
        },
      ),
      body: const PartiesScreen(),
    );
  }
}
