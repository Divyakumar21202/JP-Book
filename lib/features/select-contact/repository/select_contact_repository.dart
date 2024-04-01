import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactRepoProvider = Provider((ref) => SelectContactRepository());

class SelectContactRepository {
  Future<List<Contact>> getContacts() async {
    List<Contact> list = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        list = await FlutterContacts.getContacts(withProperties: true);
        return list;
      } else {
        throw Exception('Give Permission to access Contacts');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}