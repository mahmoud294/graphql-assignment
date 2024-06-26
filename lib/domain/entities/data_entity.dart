class RepositoriesEntity {
  final String name;
  final LanguagesEntity languages;
  final String description;

  RepositoriesEntity({
    required this.name,
    required this.languages,
    required this.description,
  });
}

class LanguagesEntity {
  final String name;

  LanguagesEntity({
    required this.name,
  });
}
