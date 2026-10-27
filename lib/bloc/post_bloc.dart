import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc({required this.repository}) : super(PostEmptyState()) {
    on<PostLoadEvent>((event, emit) async {
      if (state is PostLoadingState) return;
      emit(PostLoadingState());
      try {
        final posts = await repository.getAllPosts();
        emit(PostLoadedState(posts: posts));
      } catch (_) {
        emit(PostErrorState());
      }
    });

    on<PostClearEvent>((event, emit) {
      if (state is PostLoadingState) return;
      emit(PostEmptyState());
    });
  }
}
