import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/user_model.dart';

Future<List<User>> getUser() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

  if (response.statusCode == 200) {
    List<User> listUser = [];
    final data = json.decode(response.body);
    for (var item in data['data']) {
      listUser.add(User.fromJson(item));
    }
    return listUser;
  } else {
    throw Exception('Failed to load data');
  }
}