import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assign_2/models/user.dart';

class UserService {
  Future<UserData> requestRecentAddedUser() async {
    String url = "http://10.0.2.2:8080";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return UserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
