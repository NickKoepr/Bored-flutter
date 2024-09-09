
import 'package:bored/model/Activity.dart';
import 'package:bored/network/Activity_repository.dart';
import 'package:bored/network/impl/activity_repository_impl.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final ActivityRepository repository = ActivityRepositoryImpl();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<Activity> futureActivity;

  @override
  void initState() {
    super.initState();
    futureActivity = widget.repository.getRandomActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<Activity>(future: futureActivity, builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.activity,
                style: const TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold, height: 1.25),
              );
            } else {
              return const Icon(Icons.downloading);
            }
          }),
          const SizedBox(height: 30,),
          const Divider(
            height: 5,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
