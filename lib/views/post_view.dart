import 'package:flutter/material.dart';
import '/models/post_model.dart';
import '/controllers/post_controller.dart';
import 'package:provider/provider.dart';

//--------With provider state management-----------

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostController>(context, listen: false);
    return FutureBuilder<List<Post>>(
      future: postController.fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Post>? posts = snapshot.data;
          return ListView.builder(
              itemCount: posts!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].title ??= ''),
                  subtitle: Text(posts[index].body ??= ''),
                );
              });
        } else if (snapshot.hasError) {
          Text('${snapshot.error}');
        }
        return const CircularProgressIndicator(
          backgroundColor: Colors.grey,
        );
      },
    );
  }
}




//--------Without provider state management--------

// class PostView extends StatefulWidget {
//   const PostView({super.key});

//   @override
//   State<PostView> createState() => _PostViewState();
// }

// class _PostViewState extends State<PostView> {
//   final PostController postController = PostController();
//   late Future<List<Post>> futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     futurePosts = postController.fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Api'),
//         ),
//         body: Center(
//           child: FutureBuilder(
//             future: futurePosts,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 final posts = snapshot.data;
//                 return ListView.builder(
//                   itemCount: posts!.length,
//                   itemBuilder: (context, index) {
//                     final post = posts[index];
//                     return ListTile(
//                       title: Text(post.title ??= ''),
//                       subtitle: Text(post.body ??= ''),
//                     );
//                   },
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               return const CircularProgressIndicator(
//                 backgroundColor: Colors.grey,
//               );
//             },
//           ),
//         ));
//   }
// }

