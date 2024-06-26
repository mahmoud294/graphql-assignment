import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_graphql/di.dart';
import 'package:github_graphql/presentation/blocs/repo/repo_bloc.dart';
import 'package:github_graphql/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<RepoBloc>()..add(GetRepoEvent()),
      child: MaterialApp.router(
        routerConfig: route,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
