import 'package:ball_ball/src/presentation/screens/home/widgets/add_button.dart';
import 'package:ball_ball/src/presentation/screens/home/widgets/list_course.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo repository"),
      ),
      body: Column(
        children: [
          // list course
          SizedBox(
              height: mediaQuery.size.height * 0.8, child: const ListCourse()),
          // add course
          const AddButton(),
        ],
      ),
    );
  }
}
