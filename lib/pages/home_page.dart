import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../services/post_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/post_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(repository: PostRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Посттар тізімі'), centerTitle: true),
        body: const SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(16), child: ActionButtons()),
              Expanded(child: PostList()),
            ],
          ),
        ),
      ),
    );
  }
}
