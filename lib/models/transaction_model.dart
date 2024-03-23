class TransactionModel {
  final DateTime dateTime;
  final String reason;
  final int amount;
  final bool isCredit;

  TransactionModel({
    required this.dateTime,
    required this.reason,
    required this.amount,
    required this.isCredit,
  });
  
}
