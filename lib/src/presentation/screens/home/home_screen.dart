import 'package:ball_ball/src/presentation/screens/home/widgets/add_button.dart';
import 'package:ball_ball/src/presentation/screens/home/widgets/list_course.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo repository"),
      ),
      body: const Column(
        children: [
          // list course
          SizedBox(height: 400, child: ListCourse()),
          // add course
          AddButton(),
        ],
      ),
    );
  }
}
