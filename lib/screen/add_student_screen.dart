import 'package:flutter/material.dart';
import 'package:student_demo_appwrite/core/student_list_fetch.dart';
import 'package:student_demo_appwrite/model/student.dart';

class AddStudentScreen extends StatefulWidget {
  AddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();

  DateTime? joiningDate = DateTime.now();

  DateTime? birthDate = DateTime.now();

  int isActive = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: ListView(
        children: [
          CommonTextField(
            keyboardType: TextInputType.name,
            fieldController: nameController,
            hintText: 'Name',
          ),
          CommonTextField(
            keyboardType: TextInputType.emailAddress,
            fieldController: emailController,
            hintText: 'Email',
          ),
          CommonTextField(
            keyboardType: TextInputType.number,
            fieldController: mobileController,
            hintText: 'Mobile Number',
          ),
          CommonTextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            fieldController: rollNoController,
            hintText: 'Roll No',
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      joiningDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now());
                    },
                    child: Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: const Text(
                          'Joining Date',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      birthDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now());
                    },
                    child: Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Text(
                          'Birth Date',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 0,
                  groupValue: isActive,
                  title: const Text('Active'),
                  onChanged: (int? val) {
                    setState(() {
                      isActive = val!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: 1,
                  groupValue: isActive,
                  title: const Text('InActive'),
                  onChanged: (int? val) {
                    setState(() {
                      isActive = val!;
                    });
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                FetchStudentList.addStudent(Student(
                    sName: nameController.text,
                    sEmail: emailController.text,
                    sMobileNumber: mobileController.text,
                    sRollno: int.parse(rollNoController.text),
                    sJoiningDate:
                        joiningDate?.microsecondsSinceEpoch.toString(),
                    sBirthDate: birthDate?.microsecondsSinceEpoch.toString(),
                    sIsactive: isActive == 0 ? true : false));
                Navigator.pop(context);
              },
              child: const Text('SUBMIT'),
            ),
          ),
        ],
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.fieldController,
    required this.hintText,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: fieldController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: 'Enter ' + hintText, label: Text(hintText)),
      ),
    );
  }
}
