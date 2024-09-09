import 'package:bored/model/Activity.dart';

abstract class ActivityRepository {
  Future<Activity> getRandomActivity();
}
