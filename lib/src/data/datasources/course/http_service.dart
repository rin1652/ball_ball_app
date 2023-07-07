import 'package:ball_ball/src/domain/models/course.dart';
import 'package:http/http.dart';

import '../../../utils/constants/app_api_url.dart';
import 'package:http/http.dart' as http;

class HttpService {
  String domain = AppApiUrl.domainName;

  Future<Response> postCourseService(String urlParam, Course course) async {
    final uri = Uri.parse('$domain$urlParam');
    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer token',
      },
      body: Course.toMap(course),
    );
    return checkStatusCode(response);
  }

  Future<Response> getCourseService(String urlParam) async {
    final uri = Uri.parse('$domain$urlParam');
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer token',
      },
    );
    return checkStatusCode(response);
  }

  Future<Response> deleteCourseService(String urlParam, int id) async {
    final uri = Uri.parse('$domain$urlParam/$id');
    final response = await http.delete(
      uri,
      headers: {
        'Authorization': 'Bearer token',
      },
    );
    return checkStatusCode(response);
  }

  Future<Response> updateCourseService(
      String urlParam, Course course, int id) async {
    final uri = Uri.parse('$domain$urlParam/$id');
    final response = await http.put(
      uri,
      headers: {
        'Authorization': 'Bearer token',
      },
      body: Course.toMap(course),
    );
    return checkStatusCode(response);
  }

  Response checkStatusCode(Response respose) {
    final int statusCode = respose.statusCode;

    // 200 ok GET, PUT, PATCH, DELETE
    // 201 ok create
    // 204 ok delete
    if (statusCode == 200 || statusCode == 201 || statusCode == 204) {
      return respose;
    } else if (statusCode == 304) {
      throw Exception('Client can use cache data');
    } else if (statusCode == 400) {
      throw Exception('Request is not valid');
    } else if (statusCode == 401) {
      throw Exception('Unauthorized');
    } else if (statusCode == 403) {
      throw Exception('Forbidden');
    } else if (statusCode == 404) {
      throw Exception('Not Found');
    } else if (statusCode == 405) {
      throw Exception('Method Not Allowed');
    } else if (statusCode == 410) {
      throw Exception('Gone - Resource not available');
    } else if (statusCode == 415) {
      throw Exception('Unsupported Media Type');
    } else if (statusCode == 422) {
      throw Exception('Unprocessable Entity');
    } else if (statusCode == 429) {
      throw Exception('Too Many Requests');
    } else {
      throw Exception('Failed to load course');
    }
  }
}
