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
    final Response bodyResponse = await getService(urlCourse);
    final List<dynamic> courseList = json.decode(bodyResponse.body);
    return courseList.map((e) => Course.fromMap(e)).toList();
  }

  @override
  Future<void> createCourse(Course course) async {
    await postService(urlCourse, Course.toMap(course));
  }

  @override
  Future<void> deleteCourse(int id) async {
    await deleteService("$urlCourse/$id");
  }

  @override
  Future<void> updateCourse(Course course) async {
    await updateService("$urlCourse/${course.id}", Course.toMap(course));
  }

  @override
  Future<Course> getCourses(int id) async {
    final Response bodyResponse = await getService("$urlCourse/$id");
    final Course courSe = json.decode(bodyResponse.body);
    return courSe;
  }
}
