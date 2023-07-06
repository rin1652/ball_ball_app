import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/course.dart';
import '../../datasources/course/course_api_implement.dart';

final courseRepoProvider =
    Provider<CourseRepository>((ref) => CourseRepository(ref: ref));

class CourseRepository {

  Ref ref;

  // ignore: prefer_typing_uninitialized_variables
  var _courseApiProvider;

  CourseRepository({

    required this.ref,
  }) {
    _courseApiProvider = ref.read(courseApiProvider);
  }
  Future<List<Course>> getListCourse() async {
    final courses = await _courseApiProvider.getListCourse();
    return courses;
  }

  Future<void> createCourse(Course course) async {
    await _courseApiProvider.createCourse(course);
  }

  Future<void> deleteCourse(int id) async {
    await _courseApiProvider.deleteCourse(id);
  }

  Future<void> updateCourse(Course course) async {
    await _courseApiProvider.updateCourse(course);
  }
}
