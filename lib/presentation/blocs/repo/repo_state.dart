part of 'repo_bloc.dart';

@immutable
sealed class RepoState {}

final class RepoInitial extends RepoState {}

class RepoLoading extends RepoState {}

class RepoLoaded extends RepoState {
  final List<RepositoriesEntity> repos;

  RepoLoaded(this.repos);
}

class RepoError extends RepoState {
  final String error;

  RepoError(this.error);
}
