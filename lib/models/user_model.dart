import 'package:jp_book/models/transaction_model.dart';

class User {
  final int debit;
  final int credit;
  final List<TransactionModel> transactions;

  User({
    required this.debit,
    required this.credit,
    required this.transactions,
  });
}
