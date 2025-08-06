import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Guess JSON', home: HomePage());
  }
}

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Posts List')),
      body: postsAsync.when(
        data:
            (posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder:
                  (_, index) => ListTile(
                    title: Text("Title : ${posts[index].title}"),
                    subtitle: Text("body  : ${posts[index].body}"),
                  ),
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
