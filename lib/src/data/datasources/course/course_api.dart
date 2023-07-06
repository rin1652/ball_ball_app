import '../../../domain/models/course.dart';

abstract class CourseApi {
  Future<List<Course>> getListCourse();
  Future<void> createCourse(Course course);
  Future<void> deleteCourse(int id);
  Future<void> updateCourse(Course course);
}
