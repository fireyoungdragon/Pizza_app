import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Photo> fetchPhoto() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/3'));

  if (response.statusCode == 200) {
    return Photo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}

class NetworkingScreenTest extends StatefulWidget {
  const NetworkingScreenTest({Key? key}) : super(key: key);

  @override
  State<NetworkingScreenTest> createState() => _NetworkingScreenTestState();
}

class _NetworkingScreenTestState extends State<NetworkingScreenTest> {
  late Future<Photo> futurePhoto;

  @override
  void initState() {
    super.initState();
    futurePhoto = fetchPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Photo>(
              future: futurePhoto,
              builder: (context, ss) {
                if (ss.hasData) {
                  return Text(ss.data!.thumbnailUrl);
                } else if (ss.hasError) {
                  return Text('${ss.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
