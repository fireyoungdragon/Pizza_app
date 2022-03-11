import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

//класс Пост
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

Future<Post> fetchPost() async {
  final res =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (res.statusCode == 200) {
    return Post.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Error loading post');
  }
}

class NetworkPostForKeys32 extends StatefulWidget {
  const NetworkPostForKeys32({Key? key}) : super(key: key);

  @override
  State<NetworkPostForKeys32> createState() => _NetworkPostForKeys32State();
}

class _NetworkPostForKeys32State extends State<NetworkPostForKeys32> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Case 3.2')),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'header:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            FutureBuilder<Post>(
              future: futurePost,
              builder: (context, ss) {
                if (ss.hasData) {
                  return Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        ss.data!.title,
                        textAlign: TextAlign.center,
                      ));
                } else if (ss.hasError) {
                  return Text('${ss.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                  'content:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            FutureBuilder<Post>(
              future: futurePost,
              builder: (context, ss) {
                if (ss.hasData) {
                  return Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        ss.data!.body,
                        textAlign: TextAlign.center,
                      ));
                } else if (ss.hasError) {
                  return Text('${ss.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        )),
      ),
    );
  }
}
