import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repositories/course/course_repository.dart';
import '../../../../domain/models/course.dart';

class CourseViewModel extends StateNotifier<List<Course>> {
  Ref ref;
  CourseViewModel(
    this.ref,
  ) : super([]) {
    getListCourse();
  }

  Future<void> getListCourse() async {
    final listCourse = await ref.read(courseRepositoryProvider).getListCourse();
    state = listCourse;
  }

  Future<void> createCourse(Course course) async {
    await ref.read(courseRepositoryProvider).createOneCourse(course);
    getListCourse();
  }

  Future<void> deleteCourse(int id) async {
    await ref.read(courseRepositoryProvider).deleteOneCourse(id);
    state = state.where((course) => course.id != id).toList();
  }
}

final courseProvider = StateNotifierProvider<CourseViewModel, List<Course>>(
  (ref) => CourseViewModel(ref),
);
