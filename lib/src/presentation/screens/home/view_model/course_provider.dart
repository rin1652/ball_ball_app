import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repositories/course/course_repo.dart';
import '../../../../domain/models/course.dart';

class CourseNotifier extends StateNotifier<List<Course>> {
  Ref ref;
  CourseNotifier(
    this.ref,
  ) : super([]);

  Future<void> getListCourse() async {
    final listCourse = await ref.read(courseRepoProvider).getListCourse();
    state = listCourse;
  }

  Future<void> createCourse(Course course) async {
    await ref.read(courseRepoProvider).createCourse(course);
    getListCourse();
  }
}

final courseProvider = StateNotifierProvider<CourseNotifier, List<Course>>(
    (ref) => CourseNotifier(ref));
