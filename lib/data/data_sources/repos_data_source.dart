import 'package:github_graphql/core/error/failure.dart';
import 'package:github_graphql/data/models/data_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// ReposDataSource is an abstract class defining the contract for fetching
/// data from various sources.
/// This abstract class outlines the methods that concrete data source
/// implementations should implement, such as fetching data from a remote API, local database, or any other data source.
abstract class ReposDataSource {
  Future<RepositoriesModel> getRepositories();
}

/// ReposDataSourceImpl is the concrete implementation of the ReposDataSource
/// interface.
/// This class implements the methods defined in ReposDataSource to fetch
/// data from a remote API or other data sources.
class ReposDataSourceImpl implements ReposDataSource {
  final GraphQLClient client = GraphQLClient(
    link: HttpLink(
      "https://api.github.com/graphql",
      defaultHeaders: {
        'Authorization': 'Bearer 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',
      },
    ),
    cache: GraphQLCache(),
  );

  @override
  Future<RepositoriesModel> getRepositories() async {
    const query = r'''
query{user(login: "mahmoud294") {
    repositories(first: 40,) {
      nodes {
        name
        primaryLanguage {name}
        description
        
      }
      
    }
  }}
   ''';

    final data = await client.query(QueryOptions(document: gql(query)));
    if (data.hasException) {
      throw ServerFailure(data.exception!.graphqlErrors[0].message);
    } else {
      return RepoModel.fromJson(data.data!).user.repositories;
    }
  }
}
