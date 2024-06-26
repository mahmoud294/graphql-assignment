import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_graphql/presentation/blocs/repo/repo_bloc.dart';

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
        context.read<RepoBloc>().add(GetRepoFilteregEvent(lang: language));
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
