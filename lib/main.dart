import 'package:flutter/material.dart';
import 'package:practice_call_api/views/post_view.dart';
import 'package:provider/provider.dart';
import 'controllers/post_controller.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: PostView(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<PostController>(
      create: (context) => PostController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Fetch API'),
          ),
          body: PostView(),
        ),
      ),
    );
  }
}
