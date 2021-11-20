import 'package:assign_2/models/user.dart';
import 'package:assign_2/services/user.dart';

class UserViewModel {
  var _service = UserService();

  Future<UserData> recentUser() {
    return _service.requestRecentAddedUser();
  }
}
