import 'package:flutter/material.dart';
import 'package:jp_book/constants/app_snackbar.dart';
import 'package:jp_book/constants/app_text_field.dart';
import 'package:jp_book/features/User-Data-Widgets/single_user_data_screen.dart';

class AddPartyScreen extends StatefulWidget {
  final String name;
  final String mobileNumber;
  const AddPartyScreen(
      {super.key, required this.name, required this.mobileNumber});

  @override
  State<AddPartyScreen> createState() => _AddPartyScreenState();
}

class _AddPartyScreenState extends State<AddPartyScreen> {
  String mobileNumber = '';
  String name = '';
  String? _selectedValue = 'Customer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Party",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        child: Column(
          children: [
            const SizedBox(
              height: 21,
            ),
            AppTextField(
              controller: TextEditingController(text: widget.name),
              onChange: (val) {},
              onSubmitted: (val) {},
              hintText: 'Customer Name',
              label: 'Party Name',
              inputType: TextInputType.name,
            ),
            const SizedBox(
              height: 28,
            ),
            AppTextField(
              controller: TextEditingController(text: widget.mobileNumber),
              onChange: (val) {},
              inputType: TextInputType.number,
              prefix: const Text('+(91) '),
              label: 'Mobile Number',
              onSubmitted: (val) {
                if (val.toString().length != 10) {
                  AppSnackBar(
                          context: context,
                          message: 'Enter Valid mobile Number')
                      .show();
                }
              },
              hintText: 'Mobile Number',
            ),
            Row(
              children: [
                Text(
                  'Who are they?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey),
                ),
                Radio(
                  key: const Key('Radio Customer'),
                  value: 'Customer',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                Text(
                  'Customer',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Radio(
                  value: 'Supplier',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                Text(
                  'Supplier',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const SizedBox(
              height: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ElevatedButton(
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style!
                          .copyWith(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(vertical: 14)),
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.blue.shade900)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SingleUserDataScreen(
                              mobileNumber: widget.mobileNumber,
                              name: widget.name,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Add Customer',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              wordSpacing: 4,
                            ),
                      ),
                    ),
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
