import 'dart:convert';

import 'package:github_graphql/domain/entities/data_entity.dart';

RepoModel repoModelFromJson(String str) => RepoModel.fromJson(json.decode(str));

String repoModelToJson(RepoModel data) => json.encode(data.toJson());

// class RepoModel {
//   final Data data;

//   RepoModel({
//     required this.data,
//   });

//   factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
//         data: Data.fromJson(json["Query"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

class RepoModel {
  final User user;

  RepoModel({
    required this.user,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  final RepositoriesModel repositories;

  User({
    required this.repositories,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        repositories: RepositoriesModel.fromJson(json["repositories"]),
      );

  Map<String, dynamic> toJson() => {
        "repositories": repositories.toJson(),
      };
}

class RepositoriesModel {
  final List<RepositoryData> nodes;

  RepositoriesModel({
    required this.nodes,
  });

  factory RepositoriesModel.fromJson(Map<String, dynamic> json) =>
      RepositoriesModel(
        nodes: List<RepositoryData>.from(
            json["nodes"].map((x) => RepositoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class RepositoryData extends RepositoriesEntity {
  @override
  RepositoryData({
    required super.name,
    required super.languages,
    required super.description,
  });
  RepositoriesEntity toEntity() {
    return RepositoryData(
      name: name,
      languages: languages,
      description: description,
    );
  }

  factory RepositoryData.fromJson(Map<String, dynamic> json) => RepositoryData(
        name: json["name"],
        languages: Language.fromJson(json["primaryLanguage"]??{"name":"UnKnown"}),
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "languages": languages,
        "description": description,
      };
}

class Language extends LanguagesEntity {
  Language({
    required super.name,
  });
  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
