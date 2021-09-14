import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = "https://jsonplaceholder.typicode.com/posts";

  var _postsJson = [];

  void fetchPosts() async {
    final response = await get(Uri.parse(url));
    final jsonData = jsonDecode(response.body) as List;

    setState(() {
      _postsJson = jsonData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i) {
            final post = _postsJson[i];
            return Text("Title: ${post["title"]}\n Body:${post["body"]}\n\n ");
          },
        ),
      ),
    );
  }
}
