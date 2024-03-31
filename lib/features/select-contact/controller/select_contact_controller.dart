import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/select-contact/repository/select_contact_repository.dart';

final contactListProvider = FutureProvider((ref) {
  return ref.read(contactControllerProvider).getContacts();
});
final contactControllerProvider = Provider((ref) {
  final repo = ref.read(contactRepoProvider);
  return ContactController(
    repository: repo,
  );
});

class ContactController {
  final SelectContactRepository repository;

  ContactController({required this.repository});

  Future<List<Contact>> getContacts() async {
    return await repository.getContacts();
  }
}
