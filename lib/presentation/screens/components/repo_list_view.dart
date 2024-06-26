import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_graphql/domain/entities/data_entity.dart';
import 'package:github_graphql/presentation/blocs/repo/repo_bloc.dart';

class ReposListView extends StatefulWidget {
  const ReposListView({
    super.key,
    required this.data,
  });

  final List<RepositoriesEntity> data;

  @override
  State<ReposListView> createState() => _ReposListViewState();
}

class _ReposListViewState extends State<ReposListView> {
  late ScrollController _controller;
  @override
  void initState() {
 _controller = ScrollController()..addListener(  () {
   if(  _controller.position.extentAfter < 300){
     BlocProvider.of<RepoBloc>(context).add(GetNextRepoEvent());
   }
 },);    
 super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.data.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.all(10),
        borderOnForeground: true,
        child: ListTile(
          title: Text(widget.data[index].name),
          subtitle: Text(widget.data[index].description),
          trailing: Text("Language: ${widget.data[index].languages.name}"),
        ),
      ),
    );
  }
}
