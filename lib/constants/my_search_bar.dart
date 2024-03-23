import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});
  @override
  State<StatefulWidget> createState() => MySearchBarState();
}

class MySearchBarState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      widthFactor: 0.75,
      child: TextField(),
    );
  }
}
