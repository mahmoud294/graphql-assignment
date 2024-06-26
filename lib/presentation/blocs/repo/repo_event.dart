part of 'repo_bloc.dart';

@immutable
sealed class RepoEvent {}

class GetRepoEvent extends RepoEvent {
 
}
class GetRepoFilteregEvent extends RepoEvent {
  final String? lang;
  GetRepoFilteregEvent({this.lang});
}
