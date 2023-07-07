import 'dart:convert';
import 'package:ball_ball/src/utils/constants/app_api_url.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/course.dart';
import 'course_api.dart';
import 'package:http/http.dart';

final courseApiProvider = Provider<CourseApi>((ref) => CourseApiImplement());

class CourseApiImplement extends CourseApi {
  final String urlCourse = AppApiUrl.course;
  @override
  Future<List<Course>> getListCourse() async {
    final Response bodyResponse = await getCourseService(urlCourse);
    final List<dynamic> list = json.decode(bodyResponse.body);
    return Course.fromList(list);
  }

  @override
  Future<void> createCourse(Course course) async {
    await postCourseService(urlCourse, course);
  }

  @override
  Future<void> deleteCourse(int id) async {
    await deleteCourseService(urlCourse, id);
  }

  @override
  Future<void> updateCourse(Course course) async {
    await updateCourseService(urlCourse, course, course.id);
  }
}
