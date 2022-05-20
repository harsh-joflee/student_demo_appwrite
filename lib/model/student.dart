// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    this.sName,
    this.sRollno,
    this.sEmail,
    this.sJoiningDate,
    this.sBirthDate,
    this.sIsactive,
    this.sMobileNumber,
    this.read,
    this.write,
    this.id,
    this.collection,
  });

  String? sName;
  int? sRollno;
  String? sEmail;
  String? sJoiningDate;
  String? sBirthDate;
  bool? sIsactive;
  String? sMobileNumber;
  List<String>? read;
  List<String>? write;
  String? id;
  String? collection;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        sName: json["s_name"],
        sRollno: json["s_rollno"],
        sEmail: json["s_email"],
        sJoiningDate: json["s_joining_date"],
        sBirthDate: json["s_birth_date"],
        sIsactive: json["s_isactive"],
        sMobileNumber: json["s_mobile_number"],
        read: json["\u0024read"] == null
            ? null
            : List<String>.from(json["\u0024read"].map((x) => x)),
        write: json["\u0024write"] == null
            ? null
            : List<String>.from(json["\u0024write"].map((x) => x)),
        id: json["\u0024id"],
        collection: json["\u0024collection"],
      );

  Map<String, dynamic> toJson() => {
        "s_name": sName,
        "s_rollno": sRollno,
        "s_email": sEmail,
        "s_joining_date": sJoiningDate,
        "s_birth_date": sBirthDate,
        "s_isactive": sIsactive,
        "s_mobile_number": sMobileNumber,
        "\u0024read":
            read == null ? null : List<dynamic>.from(read!.map((x) => x)),
        "\u0024write":
            write == null ? null : List<dynamic>.from(write!.map((x) => x)),
        "\u0024id": id,
        "\u0024collection": collection,
      };
}
