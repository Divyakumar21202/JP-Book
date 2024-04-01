import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/Add-customer/screens/add_party_screen.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  final List<Contact> contacts;
  const ContactListScreen({super.key, required this.contacts});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    getContacts();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Contact> contacts = [];
  List<Contact> searchList = [];
  void getContacts() {
    contacts = widget.contacts;
    searchList = widget.contacts;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            child: TextField(
              controller: _searchController,
              onChanged: (val) {
                searchList = widget.contacts
                    .where((element) => element.displayName
                        .toLowerCase()
                        .contains(_searchController.text.toLowerCase()))
                    .toList();
                setState(() {});
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Customer name',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchList.length,
              itemBuilder: ((context, index) {
                Contact person = searchList[index];
                Uint8List? photo = person.photo ?? person.thumbnail;
                String phone = '';
                if (person.phones.isNotEmpty) {
                  phone = person.phones[0].number.replaceAll(' ', '');
                  if (phone.isEmpty) {
                    for (var doc in person.phones) {
                      if (doc.number.isNotEmpty) {
                        phone = doc.number.replaceAll(' ', '');
                      }
                    }
                  }
                  if (phone.substring(0, 3) == '+91') {
                    phone = phone.substring(3);
                  }
                }
                String letter = person.displayName[0];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddPartyScreen(
                          name: person.displayName,
                          mobileNumber: phone,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(person.displayName),
                    subtitle: Text(
                      phone,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          photo != null ? MemoryImage(photo) : null,
                      child: Text(letter),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
