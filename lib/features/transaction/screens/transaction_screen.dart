import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/constants/app_snackbar.dart';
import 'package:jp_book/constants/app_text_field.dart';
import 'package:jp_book/constants/buttons/app_button.dart';
import 'package:jp_book/features/transaction/repository/transaction_repository.dart';
import 'package:jp_book/models/transaction_model.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  final String name;
  final String mobileNumber;
  final Color color;
  const TransactionScreen({
    super.key,
    required this.mobileNumber,
    required this.name,
    required this.color,
  });

  @override
  ConsumerState<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen> {
  String rupees = '0';
  String reason = '';
  DateTime dateTime = DateTime.now();
  final TextEditingController _rupeesController =
      TextEditingController(text: '0');
  final TextEditingController _reasonController = TextEditingController();

  String date = '';
  @override
  void dispose() {
    _rupeesController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  String getMonthName(int month) {
    final Map<int, String> monthMap = {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December',
    };

    return monthMap[month] ?? 'Invalid Month';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String month = getMonthName(pickedDate.month);
      setState(() {
        date = '${pickedDate.day} ${month.substring(0, 3)} ${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: widget.color,
        title: Text(
          'You gave Rs $rupees to ${widget.name}',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7.0),
        child: Column(
          children: [
            AppTextField(
              label: 'Enter Amount',
              controller: _rupeesController,
              onChange: (val) {
                setState(() {
                  if (val.toString().isEmpty) {
                    rupees = '0';
                  } else {
                    rupees = val.toString();
                  }
                });
              },
              onSubmitted: (val) {
                setState(() {
                  if (val.toString().isEmpty) {
                    rupees = '0';
                  } else {
                    rupees = val.toString();
                  }
                });
              },
              hintText: 'Enter Amount',
              inputType: TextInputType.number,
              prefix: const Text('Rs. '),
            ),
            rupees != '0'
                ? Expanded(
                    child: Column(children: [
                    const SizedBox(
                      height: 14,
                    ),
                    AppTextField(
                      label: 'Enter Details',
                      controller: _reasonController,
                      onChange: (val) {
                        setState(() {
                          if (val.toString().isEmpty) {
                            reason = 'empty string';
                          } else {
                            reason = val.toString();
                          }
                        });
                      },
                      onSubmitted: (val) {
                        setState(() {
                          if (val.toString().isEmpty) {
                            reason = 'empty string';
                          } else {
                            reason = val.toString();
                          }
                        });
                      },
                      hintText: 'Enter details (Items,bill no.,quantity,etc.)',
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Add Bill No.',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.blue,
                                  ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: widget.color,
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                date.isEmpty
                                    ? '${dateTime.day} ${getMonthName(dateTime.month)} ${dateTime.year}'
                                    : date,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: widget.color,
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: widget.color,
                                size: 28,
                              ),
                              const SizedBox(width: 2),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Attach bills',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox())
                  ]))
                : const Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () async {
                      TransactionModel model = TransactionModel(
                        time: DateTime.now().millisecondsSinceEpoch.toString(),
                        reason: reason,
                        amount: int.parse(rupees),
                        isCredit: false,
                        mobileNumber: widget.mobileNumber,
                        date:
                            '${DateTime.now().day} ${getMonthName(DateTime.now().month).toString().substring(0, 3)} ${DateTime.now().year}',
                      );

                      await ref
                          .read(transactionRepositoryProvider)
                          .uploadTransaction(model)
                          .whenComplete(() {
                        AppSnackBar(context: context, message: reason).show();
                      });
                    },
                    text: 'SAVE',
                    color: widget.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
