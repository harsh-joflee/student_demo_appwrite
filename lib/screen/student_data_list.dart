import 'package:flutter/material.dart';
import 'package:student_demo_appwrite/model/student.dart';

import '../core/student_list_fetch.dart';
import 'Widget/student_card.dart';

class StudentDataList extends StatefulWidget {
  StudentDataList({Key? key}) : super(key: key);

  @override
  State<StudentDataList> createState() => _StudentDataListState();
}

class _StudentDataListState extends State<StudentDataList> {
  @override
  void initState() {
    super.initState();
    getListOfStudent();
  }

  getListOfStudent() async {
    studentList = await FetchStudentList.fetchStudents();
    setState(() {});
  }

  List<Student> studentList = [];

  @override
  Widget build(BuildContext context) {
    return studentList.isEmpty
        ? const Center(
            child: Text(
              'NO DATA FOUND',
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) =>
                StudentCard(student: studentList[index]),
            itemCount: studentList.length,
          );
  }
}
