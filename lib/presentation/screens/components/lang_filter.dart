import 'package:flutter/material.dart';

class DropDownFilterWidget extends StatefulWidget {
  const DropDownFilterWidget({super.key});

  @override
  State<DropDownFilterWidget> createState() => _DropDownFilterWidgetState();
}

class _DropDownFilterWidgetState extends State<DropDownFilterWidget> {
  String? language;
  List<String> progrmainglanguages = [
    "HTML",
    "CSS",
    "Kotlin",
    "JavaScript",
    "Dart",
    "Swift",
    "Python",
    "Java",
    "C",
    "C++",
    "C#",
    "PHP",
    "Ruby",
    "Go",
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      onSelected: (value) {
        setState(() {
          language = value;
        });
      },
      dropdownMenuEntries: [
        const DropdownMenuEntry(
          value: null,
          label: "All",
        ),
        ...progrmainglanguages.map(
          (e) => DropdownMenuEntry(
            label: e,
            value: e,
          ),
        ),
      ],
    );
  }
}
