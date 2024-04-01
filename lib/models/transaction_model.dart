class TransactionModel {
  final String time;
  final String reason;
  final int amount;
  final bool isCredit;
  final String mobileNumber;
  final String date;

  TransactionModel({
    required this.time,
    required this.reason,
    required this.amount,
    required this.isCredit,
    required this.mobileNumber,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'reason': reason,
      'amount': amount,
      'isCredit': isCredit,
      'mobileNumber': mobileNumber,
      'date': date,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      time: map['time'] as String,
      reason: map['reason'] as String,
      amount: map['amount'] as int,
      isCredit: map['isCredit'] as bool,
      mobileNumber: map['mobileNumber'] as String,
      date: map['date'] as String,
    );
  }
}
