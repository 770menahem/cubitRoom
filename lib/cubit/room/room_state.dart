part of 'room_cubit.dart';

class RoomState {
  final List<Room> rooms;

  RoomState({required this.rooms});
}

class Room {
  late final int id;
  List<Student> students;
  final Teacher teacher;
  final String name;
  double long;
  DateTime? date;

  Room({
    int? id,
    required this.students,
    required this.teacher,
    required this.name,
    this.long = 1,
    this.date,
  }) {
    this.id = id ?? count++;
  }

  studentIndex(int id) => this.students.firstWhere((std) => std.id == id);

  changeStatus(int studentId) {
    Student student = this.students.firstWhere((std) => std.id == studentId);

    student.isPresent = !student.isPresent;
  }

  Student? isExsist(int studentId) {
    try {
      return this.students.firstWhere((stud) => stud.id == studentId);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'students': students.map((x) => x.toMap()).toList(),
      'teacher': teacher.toMap(),
      'name': name,
      'long': long,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'],
      students:
          List<Student>.from(map['students']?.map((x) => Student.fromMap(x))),
      teacher: Teacher.fromMap(map['teacher']),
      name: map['name'],
      long: map['long'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) => Room.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Room && other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        students.hashCode ^
        teacher.hashCode ^
        name.hashCode ^
        long.hashCode ^
        date.hashCode;
  }

  Room copyWith({
    int? id,
    List<Student>? students,
    Teacher? teacher,
    String? name,
    double? long,
    DateTime? date,
  }) {
    return Room(
      id: id ?? this.id,
      students: students ??
          this.students.map((e) => e.copyWith(isPresent: false)).toList(),
      teacher: teacher ?? this.teacher.copyWith(),
      name: name ?? this.name,
      long: long ?? this.long,
      date: date ?? this.date,
    );
  }
}
