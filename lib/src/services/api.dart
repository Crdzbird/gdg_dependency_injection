import 'dart:convert';

import 'package:gdg_dependency_injection/src/models/post.dart';
import 'package:gdg_dependency_injection/src/models/user.dart';
import 'package:gdg_dependency_injection/src/models/comment.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const endpoint = 'https://jsonplaceholder.typicode.com';
  var client = http.Client();

  Future<User> getUserProfile(int userId) async {
    var response = await client.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostForUser(int userId) async {
    var posts = List<Post>();
    var response = await client.get('$endpoint/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }
    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();
    var response = await client.get('$endpoint/comments?postId=$postId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed) {
      var c = Comment.fromJson(comment);
      comments.add(c);
    }
    return comments;
  }
}
