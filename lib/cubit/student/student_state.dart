part of 'student_cubit.dart';

class StudentState {
  List<Student> students;

  StudentState({required this.students});

  List<Student> get props => students;
}

class Student {
  late final int id;
  final String name;
  bool isPresent = false;

  Student({required this.name, isPresent, int? id}) {
    this.id = id ?? count++;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isPresent': isPresent,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: int.parse(map['id']),
      name: map['name'],
      isPresent: true == map['isPresent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  Student copyWith({
    int? id,
    String? name,
    bool? isPresent,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      isPresent: isPresent ?? this.isPresent,
    );
  }
}
