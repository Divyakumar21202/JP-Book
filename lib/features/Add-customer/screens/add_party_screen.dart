import 'package:flutter/material.dart';
import 'package:jp_book/constants/app_text_field.dart';

class AddPartyScreen extends StatefulWidget {
  final String name;
  final String mobileNumber;
  const AddPartyScreen(
      {super.key, required this.name, required this.mobileNumber});

  @override
  State<AddPartyScreen> createState() => _AddPartyScreenState();
}

class _AddPartyScreenState extends State<AddPartyScreen> {
  String? _selectedValue = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Party",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          AppTextField(
            controller: TextEditingController(text: widget.name),
            onChange: (val) {},
            onSubmitted: (val) {},
            hintText: 'Customer Name',
          ),
          AppTextField(
            controller: TextEditingController(text: widget.mobileNumber),
            onChange: (val) {},
            onSubmitted: (val) {},
            hintText: 'Mobile Number',
          ),
          Column(
            children: [
              const Text('Who are they?'),
              RadioListTile<String>(
                title: const Text('Option 1'),
                value: 'Option 1',
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Option 2'),
                value: 'Option 2',
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
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
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue.shade900)),
                    onPressed: () {},
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
    );
  }
}
