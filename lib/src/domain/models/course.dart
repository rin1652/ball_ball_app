// change from branch delete
class Course {
  final int id;
  final String name;
  final String description;
  Course({
    required this.id,
    required this.name,
    required this.description,
  });

  static Map<String, String> toMap(Course course) {
    return <String, String>{
      'name': course.name,
      'description': course.description,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  static List<Course> fromList(List<dynamic> list) {
    return list.map((e) => Course.fromMap(e)).toList();
  }
}
