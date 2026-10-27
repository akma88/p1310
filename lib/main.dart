import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(const PostsApp());

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Посттар тізімі',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
