import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/Customers/repository/customer_repository.dart';

final contactRepoProvider = Provider(
  (ref) => SelectContactRepository(
    customerRepository: ref.read(
      customerRepositoryProvider,
    ),
  ),
);

class SelectContactRepository {
  final CustomerRepository customerRepository;

  SelectContactRepository({required this.customerRepository});
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

  Future<bool> isUserExist(String mobileNumber) async {
    try {
      var list = await customerRepository.firestore
          .collection('users')
          .doc('9484676117')
          .collection('customers')
          .get();
      for (var element in list.docs) {
        if (element.data()['mobileNumber'] == mobileNumber) {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw FirebaseException(plugin: e.toString());
    }
  }
}
