import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/models/transaction_model.dart';
import 'package:uuid/uuid.dart';

final transactionRepositoryProvider = Provider(
  (ref) => TransactionRepository(
    firebaseFirestore: FirebaseFirestore.instance,
  ),
);

class TransactionRepository {
  final FirebaseFirestore firebaseFirestore;

  TransactionRepository({required this.firebaseFirestore});

  Future uploadTransaction(TransactionModel model) async {
    try {
      String uid = const Uuid().v1();
      Map<String, dynamic> data = model.toMap();
      await firebaseFirestore
          .collection('users')
          .doc('9484676117')
          .collection('customers')
          .doc(model.mobileNumber)
          .collection('transactions')
          .doc(uid)
          .set(data);

      await firebaseFirestore
          .collection('users')
          .doc('9484676117')
          .collection('customers')
          .doc(model.mobileNumber)
          .set(data);
          
    } catch (e) {
      throw FirebaseException(plugin: e.toString());
    }
  }
}
