import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/course.dart';
import '../../datasources/course/course_repository_impl.dart';

final courseRepoProvider = Provider<CourseRepo>((ref) => CourseRepo(ref: ref));

class CourseRepo {
  Ref ref;

  CourseRepo({
    required this.ref,
  });

  Future<List<Course>> getListCourse() async {
    final courses = await ref.read(courseApiProvider).getListCourse();
    return courses;
  }

  Future<void> createCourse(Course course) async {
    await ref.read(courseApiProvider).createCourse(course);
  }

  Future<void> deleteCourse(int id) async {
    await ref.read(courseApiProvider).deleteCourse(id);
  }
}
