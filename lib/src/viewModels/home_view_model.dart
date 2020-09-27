import 'package:gdg_dependency_injection/src/enums/view_state.dart';
import 'package:gdg_dependency_injection/src/injector/injector.dart';
import 'package:gdg_dependency_injection/src/models/post.dart';
import 'package:gdg_dependency_injection/src/services/api.dart';
import 'package:gdg_dependency_injection/src/viewModels/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  ApiService _api = locator<ApiService>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.BUSY);
    posts = await _api.getPostForUser(userId);
    setState(ViewState.IDLE);
  }
}
