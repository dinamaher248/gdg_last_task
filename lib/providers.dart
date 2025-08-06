import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'services/api_service.dart';
import 'models/post.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final postsProvider = FutureProvider<List<Post>>((ref) async {
  return ref.read(apiServiceProvider).fetchPosts();
});
