import 'package:bloc/bloc.dart';
import 'package:github_graphql/domain/entities/data_entity.dart';
import 'package:github_graphql/domain/usecases/repos_usecases.dart';
import 'package:meta/meta.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final ReposUseCase reposUseCase;

  RepoBloc(this.reposUseCase) : super(RepoInitial()) {
    on<GetRepoEvent>(
      (event, emit) async {
        emit(
          RepoLoading(),
        );
        final data = await reposUseCase.getRepos();
        data.fold(
          (l) => emit(RepoError(l.message)),
          (r) => emit(RepoLoaded(r)),
        );
      },
    );
  }
}
