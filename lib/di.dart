import 'package:get_it/get_it.dart';
import 'package:github_graphql/data/data_sources/repos_data_source.dart';
import 'package:github_graphql/data/repositories/repo_repository_impl.dart';
import 'package:github_graphql/domain/repositories/repos_repository.dart';
import 'package:github_graphql/domain/usecases/repos_usecases.dart';
import 'package:github_graphql/presentation/blocs/repo/repo_bloc.dart';

final injector = GetIt.instance;

void setupInjector() {
  injector.registerFactory(() => RepoBloc(injector()));
  injector.registerLazySingleton(() => ReposUseCase(injector()));
  injector.registerLazySingleton<ReposRepository>(
    () => ReposRepositoryImpl(injector()),
  );
  injector.registerLazySingleton<ReposDataSource>(() => ReposDataSourceImpl());
}
