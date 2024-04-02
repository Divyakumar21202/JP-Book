import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/transaction/repository/transaction_repository.dart';
import 'package:jp_book/models/transaction_model.dart';

final userDataRepositoryProvider = Provider((ref) {
  TransactionRepository repository = ref.read(transactionRepositoryProvider);
  return UserDataRepository(
    repository: repository,
  );
});

class UserDataRepository {
  final TransactionRepository repository;

  UserDataRepository({
    required this.repository,
  });

  Future<List<TransactionModel>> getSingleUserAllTransactions(
      String mobileNumber) async {
    try {
      List<TransactionModel> list = [];
      repository.firebaseFirestore
          .collection('users')
          .doc('9484676117')
          .collection('customers')
          .doc(mobileNumber)
          .collection('transactions')
          .get()
          .then((value) {
        value.docs;
        for (var doc in value.docs) {
          list.add(TransactionModel.fromMap(doc.data()));
        }
      }).onError((error, stackTrace) {
        throw FirebaseException(plugin: error.toString());
      });
      return list;
    } catch (e) {
      throw FirebaseException(plugin: e.toString());
    }
  }

  Stream<List<TransactionModel>> getUserAllTransactions(String mobileNumber) {
    try {
      return repository.firebaseFirestore
          .collection('users')
          .doc('9484676117')
          .collection('customers')
          .doc(mobileNumber)
          .collection('transactions')
          .snapshots()
          .asyncMap((event) {
        List<TransactionModel> list = [];
        for (var element in event.docs) {
          list.add(TransactionModel.fromMap(element.data()));
        }
        return list;
      });
    } catch (e) {
      throw FirebaseException(plugin: e.toString());
    }
  }
}
