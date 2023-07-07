import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/course.dart';
import '../view_model/course_view_model.dart';

class ListCourse extends ConsumerWidget {
  const ListCourse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Course> listCourse = ref.watch(courseProvider).reversed.toList();

    return Center(
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
                        ref.read(courseProvider.notifier).deleteCourse(e.id);
                      },
                      child: const Text('Click delete'),
                    ),
                  ],
                );
              },
            ).toList(),
          ]),
        ),
      ),
    );
  }
}
