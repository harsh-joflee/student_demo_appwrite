import 'package:flutter/material.dart';
import 'package:student_demo_appwrite/model/student.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.sName ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(student.sEmail ?? ''),
          Text(
            DateTime.fromMicrosecondsSinceEpoch(
              int.parse(student.sJoiningDate ?? '0'),
            ).toString(),
          ),
          Text(
            DateTime.fromMicrosecondsSinceEpoch(
              int.parse(student.sBirthDate ?? '0'),
            ).toString(),
          ),
        ],
      ),
      leading: Icon(
        Icons.person,
        color: student.sIsactive ?? false ? Colors.green : Colors.red,
      ),
      trailing: Text(student.sRollno.toString()),
    );
  }
}
