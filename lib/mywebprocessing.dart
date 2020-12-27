//  "postId": 1,
//     "id": 1,
//     "name": "id labore ex et quam laborum",
//     "email": "Eliseo@gardner.biz",
// "body": "laudantium enim quasi est quidem magnam voluptate
//ipsam eos\ntempora quo necessitatibus\ndolor quam autem
// quasi\nreiciendis et nam sapiente accusantium"
//https://jsonplaceholder.typicode.com/posts/1/comments    [5 comments ]
//https://jsonplaceholder.typicode.com/comments      [500 comments]
import 'dart:convert';

import 'package:http/http.dart ' as http;

class Webcomments {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Webcomments({this.postId, this.id, this.name, this.email, this.body});
  factory Webcomments.fromjson(Map<String, dynamic> json) {
    return Webcomments(
        postId: json['postId'] as int,
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        body: json['body'] as String);
  }
}

fetchwebcomments() async {
  http.Client client = http.Client();
  final returneddata =
      await client.get('https://jsonplaceholder.typicode.com/posts/1/comments');
  //print(returneddata.body);

  final parsed = jsonDecode(returneddata.body).cast<Map<String, dynamic>>();
  // print(parsed);
  return parsed.map<Webcomments>((json) => Webcomments.fromjson(json)).toList();
  //print(parsed.map<Webcomments>((json) => Webcomments.fromjson(json)).toList());
}
