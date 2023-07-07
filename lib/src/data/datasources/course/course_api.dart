import 'package:ball_ball/src/data/datasources/course/http_service.dart';

import '../../../domain/models/course.dart';

abstract class CourseApi extends HttpService {
  Future<List<Course>> getListCourse();
  Future<void> createCourse(Course course);
  Future<void> deleteCourse(int id);
  Future<void> updateCourse(Course course);
}
