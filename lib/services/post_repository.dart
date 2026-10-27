import '../model/post.dart';
import 'post_api_provider.dart';

class PostRepository {
  final PostApiProvider _provider = PostApiProvider();

  Future<List<Post>> getAllPosts() => _provider.getPosts();
}
