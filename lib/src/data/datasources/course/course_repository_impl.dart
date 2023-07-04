import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/course.dart';
import 'course_api.dart';
import 'package:http/http.dart' as http;

final courseApiProvider = Provider<CourseApi>((ref) => CourseRepositoryImpl());

class CourseRepositoryImpl implements CourseApi {
  @override
  Future<List<Course>> getListCourse() async {
    final url = Uri.parse(link);
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'key abc',
    });

    if (response.statusCode == 200) {
      final List<dynamic> list = json.decode(response.body);
      return Course.fromList(list);
    } else {
      throw Exception('Failed to load course');
    }
  }

  @override
  Future<void> createCourse(Course course) async {
    final url = Uri.parse(link);
    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: 'key abc',
        },
        body: Course.toMap(course));

    if (response.statusCode == 201) {
      // print(response.body);
      // final List<dynamic> list = json.decode(response.body);

      // return Course.fromList(list);
    } else {
      throw Exception('Failed to load course');
    }
  }

  @override
  Future<void> deleteCourse(int id) async {
    final url = Uri.parse('$link/$id');
    final response = await http.delete(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'key abc',
      },
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load course');
    }
  }

  @override
  Future<void> updateCourse(Course course) {
    // TODO: implement updateCourse
    throw UnimplementedError();
  }
}
