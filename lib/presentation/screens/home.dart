import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_graphql/presentation/blocs/repo/repo_bloc.dart';
import 'package:github_graphql/presentation/screens/components/lang_filter.dart';
import 'package:github_graphql/presentation/screens/components/repo_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: const [
          DropDownFilterWidget(),
        ],
      ),
      body: BlocBuilder<RepoBloc, RepoState>(
        builder: (context, state) {
          if (state is RepoLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is RepoError) {
            return Center(child: Text(state.error));
          } else if (state is RepoLoaded) {
            final data = state.repos;
            if (data.isEmpty) {
              return const Center(child: Text('No data found'));
            }
            return ReposListView(data: data);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}


