import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_graphql/core/error/exception.dart';
import 'package:github_graphql/core/error/failure.dart';
import 'package:github_graphql/data/data_sources/repos_data_source.dart';
import 'package:github_graphql/domain/entities/data_entity.dart';
import 'package:github_graphql/domain/repositories/repos_repository.dart';

/// ReposRepositoryImpl is the concrete implementation of the ReposRepository
/// interface.
/// This class implements the methods defined in ReposRepository to interact
/// with data. It acts as a bridge between the domain layer
/// (use cases) and the data layer (data sources).
class ReposRepositoryImpl implements ReposRepository {
  final ReposDataSource reposDataSource;
  ReposRepositoryImpl(this.reposDataSource);

  @override
  Future<Either<Failure, List<RepositoriesEntity>>> getRepos() async {
    try {
      final data = await reposDataSource.getRepositories();
      return Right(
        data.nodes
            .map(
              (e) => e.toEntity(),
            )
            .toList(),
      );
    } on ServerException {
      return const Left(ServerFailure("Server Error"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed To Connect To the internet"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
