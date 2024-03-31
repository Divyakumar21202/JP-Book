import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/select-contact/controller/select_contact_controller.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getContacts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Contact> contacts = [];
  List<Contact> searchList = [];
  void getContacts() {
    ref.read(contactControllerProvider).getContacts().then((value) {
      contacts = value;
      searchList = contacts;
      setState(() {});
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    });
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
                searchList = contacts
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
                String phone =
                    person.phones.isEmpty ? '' : person.phones.first.toString();
                String letter = person.displayName[0];
                return ListTile(
                  title: Text(person.displayName),
                  subtitle: Text(phone),
                  leading: CircleAvatar(
                    backgroundImage: photo != null ? MemoryImage(photo) : null,
                    child: Text(letter),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
