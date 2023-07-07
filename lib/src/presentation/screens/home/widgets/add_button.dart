import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/course.dart';
import '../view_model/course_view_model.dart';

class AddButton extends ConsumerWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(courseProvider.notifier).createCourse(
            Course(id: 2, name: 'C++', description: 'C++ is dark'));
      },
      child: const Text('Click add'),
    );
  }
}
