import 'package:gdg_dependency_injection/src/enums/view_state.dart';
import 'package:gdg_dependency_injection/src/injector/injector.dart';
import 'package:gdg_dependency_injection/src/services/api.dart';
import 'package:gdg_dependency_injection/src/viewModels/base_view_model.dart';
import 'package:gdg_dependency_injection/src/models/comment.dart';

class CommentViewModel extends BaseViewModel {
  ApiService _api = locator<ApiService>();
  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.BUSY);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.IDLE);
  }
}
