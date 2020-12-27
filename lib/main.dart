import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicingwebapi_demo/mywebprocessing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('WEB API COMMENTS POST DEMO'),
              backgroundColor: Colors.pink,
            ),
            body: FutureBuilder(
              future: fetchwebcomments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return Mycomments(comments: snapshot.data);
              },
            )));
  }
}

class Mycomments extends StatelessWidget {
  final List<Webcomments> comments;

  const Mycomments({Key key, this.comments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                comments[index].name,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(comments[index].email, style: TextStyle(fontSize: 30.0)),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                color: Colors.green[200],
                height: 150.0,
                child: Text(comments[index].body,
                    style: TextStyle(fontSize: 20.0)),
              ),
            ),
          ],
        );
      },
    );
  }
}
