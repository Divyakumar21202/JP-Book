// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  final String time;
  final String reason;
  final int amount;
  final bool isCredit;
  final String mobileNumber;
  final String date;
  final String transactionId;
  final String customerName;
  final int total;
  TransactionModel({
    required this.time,
    required this.reason,
    required this.amount,
    required this.isCredit,
    required this.mobileNumber,
    required this.date,
    required this.transactionId,
    required this.customerName,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'reason': reason,
      'amount': amount,
      'isCredit': isCredit,
      'mobileNumber': mobileNumber,
      'date': date,
      'transactionId': transactionId,
      'customerName': customerName,
      'total': total,
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
      transactionId: map['transactionId'] as String,
      customerName: map['customerName'] as String,
      total: map['total'] as int,
    );
  }

  TransactionModel copyWith({
    String? time,
    String? reason,
    int? amount,
    bool? isCredit,
    String? mobileNumber,
    String? date,
    String? transactionId,
    String? customerName,
    int? total,
  }) {
    return TransactionModel(
      time: time ?? this.time,
      reason: reason ?? this.reason,
      amount: amount ?? this.amount,
      isCredit: isCredit ?? this.isCredit,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      date: date ?? this.date,
      transactionId: transactionId ?? this.transactionId,
      customerName: customerName ?? this.customerName,
      total: total ?? this.total,
    );
  }
}
