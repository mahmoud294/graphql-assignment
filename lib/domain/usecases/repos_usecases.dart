import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_graphql/core/error/exception.dart';
import 'package:github_graphql/core/error/failure.dart';
import 'package:github_graphql/domain/entities/data_entity.dart';
import 'package:github_graphql/domain/repositories/repos_repository.dart';

/// use case is a class responsible for encapsulating a specific piece of business logic or
/// a particular operation that your application needs to perform.
/// It acts as a bridge between the presentation
/// layer and the data layer.
class ReposUseCase {
  final ReposRepository reposRepository;
  ReposUseCase(this.reposRepository);
  Future<Either<Failure, RepositoriesPageEntity>> getRepos(String? after) async {
    try {
      return await reposRepository.getRepos( after);
    } on ServerException {
      return const Left(ServerFailure("Server Error"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed To Connect To the internet"));
    }
  }
}
