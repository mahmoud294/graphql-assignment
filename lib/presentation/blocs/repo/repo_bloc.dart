import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:github_graphql/domain/entities/data_entity.dart';
import 'package:github_graphql/domain/usecases/repos_usecases.dart';
import 'package:meta/meta.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final ReposUseCase reposUseCase;
  List<RepositoriesEntity> repos = [];
   PageInfoEntity? pageInfoEntity;
  RepoBloc(this.reposUseCase) : super(RepoInitial()) {
    on<GetRepoEvent>(
      (event, emit) async {
        emit(
          RepoLoading(),
        );
        final data = await reposUseCase.getRepos(null);
        data.fold(
          (l) => emit(RepoError(l.message)),
          (r) {
            emit(RepoLoaded(r.repositories));
            repos = r.repositories;
            pageInfoEntity = PageInfoEntity(
              hasNextPage: r.pageInfo.hasNextPage,
              endCursor: r.pageInfo.endCursor,
              hasPreviousPage: r.pageInfo.hasPreviousPage,
            );
            
          },
        );
      },
    );
    on<GetNextRepoEvent>(
      (event, emit) async {
        if (pageInfoEntity!.hasNextPage) {
          final data = await reposUseCase.getRepos(pageInfoEntity!.endCursor);
          data.fold(
            (l) => emit(RepoError(l.message)),
            (r) {
              repos.addAll(r.repositories);
              emit(RepoLoaded(repos));
              pageInfoEntity = r.pageInfo;
            },
          );
        }
      },
      transformer: droppable(),
    );
    on<GetRepoFilteregEvent>(
      (event, emit) {
        if (event.lang != null) {
          emit(
            RepoLoaded(
              repos
                  .where((element) => element.languages.name == event.lang)
                  .toList(),
            ),
          );
        } else {
          emit(
            RepoLoaded(repos),
          );
        }
      },
    );
  }
}
