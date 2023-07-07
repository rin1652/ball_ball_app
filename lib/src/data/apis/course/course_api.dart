import 'package:ball_ball/src/services/http_service.dart';

import '../../../domain/models/course.dart';

abstract class CourseApi extends HttpService {
  Future<List<Course>> getListCourse();
  Future<Course> getCourses(int id);
  Future<void> createCourse(Course course);
  Future<void> deleteCourse(int id);
  Future<void> updateCourse(Course course);
}
