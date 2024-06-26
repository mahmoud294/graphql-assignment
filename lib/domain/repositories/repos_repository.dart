import 'package:github_graphql/core/error/failure.dart';
import 'package:github_graphql/domain/entities/data_entity.dart';
import "package:dartz/dartz.dart";

/// ReposRepository is an abstract class defining the contract for operations
/// related to data within the domain layer.
/// Concrete implementations of this repository interface will be provided
/// in the data layer to interact with specific data sources (e.g., API, database).
abstract class ReposRepository {
  Future<Either<Failure, List<RepositoriesEntity>>> getRepos();
}
