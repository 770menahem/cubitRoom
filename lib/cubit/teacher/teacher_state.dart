part of 'teacher_cubit.dart';

class TeacherState {
  List<Teacher> teachers;

  TeacherState({required this.teachers});

  List<Teacher> get props => teachers;
}

class Teacher {
  late final int id;
  final String name;

  Teacher({required this.name, int? id}) {
    this.id = id ?? count++;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source));

  Teacher copyWith({
    int? id,
    String? name,
  }) {
    return Teacher(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
