import 'package:flutter/material.dart';
import 'package:gdg_dependency_injection/src/enums/view_state.dart';
import 'package:gdg_dependency_injection/src/injector/injector.dart';
import 'package:gdg_dependency_injection/src/models/post.dart';
import 'package:gdg_dependency_injection/src/models/tiny_user.dart';
import 'package:gdg_dependency_injection/src/screens/base_screen.dart';
import 'package:gdg_dependency_injection/src/viewModels/home_view_model.dart';

class PostScreen extends StatelessWidget {
  final TinyUser tinyUser = locator<TinyUser>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (viewModel) => viewModel.getPosts(tinyUser.id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.cyan,
        body: model.state == ViewState.BUSY
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${tinyUser.name}',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Here are all your posts'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: getPostsUi(
                      model.posts,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => _postItem(posts[index]),
      );

  Widget _postItem(Post post) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            offset: Offset(0.0, 2.0),
            color: Color.fromARGB(80, 0, 0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
          ),
          Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}
