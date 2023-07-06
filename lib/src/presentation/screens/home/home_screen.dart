import 'package:ball_ball/src/presentation/screens/home/view_model/course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/course.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Course> listCourse = ref.watch(courseProvider).reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo repository"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              ...listCourse.map(
                (e) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.name),
                      ElevatedButton(
                          onPressed: () {
                            ref
                                .read(courseProvider.notifier)
                                .deleteCourse(e.id);
                          },
                          child: const Text('Click delete')),
                    ],
                  );
                },
              ).toList(),
              ElevatedButton(
                  onPressed: () {
                    ref.read(courseProvider.notifier).createCourse(
                        Course(id: 2, name: 'C++', description: 'C++ is dark'));
                  },
                  child: const Text('Click add')),
            ]),
          ),
        ),
      ),
    );
  }
}
