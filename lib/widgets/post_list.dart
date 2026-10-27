import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_state.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PostErrorState) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Жүктеу қатесі. Интернетті тексеріп, «Жүктеу» батырмасын қайта басыңыз.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        if (state is PostLoadedState) {
          if (state.posts.isEmpty) {
            return const Center(child: Text('Посттар табылмады.'));
          }
          return Column(
            children: [
              Text('Жүктелген посттар: ${state.posts.length}'),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Пост №${post.id}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              post.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(post.body),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const Center(
          child: Text(
            'Посттарды көру үшін «Жүктеу» батырмасын басыңыз.',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
