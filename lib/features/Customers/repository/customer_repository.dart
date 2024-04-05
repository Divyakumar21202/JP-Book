import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/models/transaction_model.dart';

final customerRepositoryProvider = Provider(
    (ref) => CustomerRepository(firestore: FirebaseFirestore.instance));

class CustomerRepository {
  final FirebaseFirestore firestore;

  CustomerRepository({
    required this.firestore,
  });

  Stream<List<TransactionModel>> getCustomerList() {
    try {
      return firestore
          .collection('users')
          .doc('9484676117')
          .collection('customers')
          .snapshots()
          .asyncMap((event) {
        List<TransactionModel> list = [];
        for (var element in event.docs) {
          if (element['total'] != 0 || element['amount'] != 0) {
            list.add(TransactionModel.fromMap(element.data()));
          }
        }
        return list;
      });
    } catch (e) {
      throw FirebaseException(plugin: e.toString());
    }
  }
}
