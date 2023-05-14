import 'package:intl/intl.dart';

class Attendance {
  String? regNo, course, faculty, department, level, fullname;
  int? rawDate;
  Attendance(
      {this.regNo,
      this.rawDate,
      this.course,
      this.faculty,
      this.department,
      this.level,
      this.fullname});

  String get date =>
      getDateString(DateTime.fromMillisecondsSinceEpoch(rawDate!));

  String getDateString(DateTime dt) {
    return DateFormat.yMEd().format(dt);
  }

  factory Attendance.fromJSON(Map<String, dynamic> json) {
    return Attendance(
        regNo: json["regno"],
        rawDate: DateTime.parse(json["createdAt"]).millisecondsSinceEpoch,
        faculty: json["faculty"],
        department: json["department"],
        level: json["level"],
        fullname: json["surname"] + " " + json["firstname"],
        course: json["coursecode"]);
  }
}
