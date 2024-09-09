import 'dart:convert';

import 'package:bored/model/Activity.dart';
import 'package:bored/network/Activity_repository.dart';
import 'package:http/http.dart' as http;

class ActivityRepositoryImpl implements ActivityRepository {
  @override
  Future<Activity> getRandomActivity() async {
    final response = await http.get(Uri.parse("https://bored-api.appbrewery.com/random"));

    if (response.statusCode == 200) {
      return Activity.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Failed to load, replace this with custom exception :)");
    }
  }
}
