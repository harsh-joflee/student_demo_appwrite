import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:student_demo_appwrite/core/appwrite_client.dart';
import 'package:student_demo_appwrite/model/student.dart';
import 'package:uuid/uuid.dart';

abstract class FetchStudentList {
  static Future<String> getUseIDByLogin() async {
    try {
      var response = await AppWriteClient.account.createSession(
        email: 'harsh.moradiya@joflee.com',
        password: 'joflee@13',
      );
      return response.userId;
    } catch (e) {
      return '';
    }
  }

  static Future<List<Student>> fetchStudents() async {
    String collectionId = 'studentData';

    try {
      var response = await AppWriteClient.database.listDocuments(
        collectionId: collectionId,
        queries: [
          // Query.greater('s_rollno', 1),
          // Query.search('s_name', 'joflee'),
          Query.search('s_email', 'joflee.com'),
        ],
        // orderAttributes: ['s_birth_date'],
        // orderTypes: ['DESC'],
      );
      print(response);
      var studentsList = response.documents
          .map(
            (doc) => studentFromJson(
              jsonEncode(
                doc.data,
              ),
            ),
          )
          .toList();
      return studentsList;
    } on AppwriteException catch (e) {
      print(e);
      return [];
    }
  }

  static Future<void> addStudent(Student student) async {
    String collectionId = 'studentData';

    var uuid = Uuid();
    var userID = getUseIDByLogin();

    try {
      var response = await AppWriteClient.database.createDocument(
        collectionId: collectionId,
        documentId: uuid.v4(),
        data: student.toJson(),
      );
      print(response);
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}
