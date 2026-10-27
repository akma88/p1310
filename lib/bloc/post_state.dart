import '../model/post.dart';

abstract class PostState {}

class PostEmptyState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<Post> posts;
  PostLoadedState({required this.posts});
}

class PostErrorState extends PostState {}
