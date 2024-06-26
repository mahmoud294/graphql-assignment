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
class RepositoriesPageEntity {
  final List<RepositoriesEntity> repositories;
  final PageInfoEntity pageInfo;

  RepositoriesPageEntity({
    required this.repositories,
    required this.pageInfo,
  });
}

class PageInfoEntity {
  final String endCursor;
  final bool hasNextPage;
  final bool hasPreviousPage;
  PageInfoEntity({
    required this.hasNextPage,
    required this.endCursor,
    required this.hasPreviousPage,
  });
}

class LanguagesEntity {
  final String name;

  LanguagesEntity({
    required this.name,
  });
}
