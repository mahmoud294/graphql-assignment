import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_graphql/presentation/blocs/repo/repo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<RepoBloc, RepoState>(
        builder: (context, state) {
          if (state is RepoLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is RepoError) {
            return Center(child: Text(state.error));
          } else if (state is RepoLoaded) {
            final data = state.repos;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].name),
                subtitle: Text(data[index].description),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
