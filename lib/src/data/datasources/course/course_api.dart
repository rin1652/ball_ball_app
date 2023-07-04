import '../../../domain/models/course.dart';

const String link = 'http://localhost:3000/courses';

abstract class CourseApi {
  Future<List<Course>> getListCourse();
  Future<void> createCourse(Course course);
}
