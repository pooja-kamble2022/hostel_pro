// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hostel_pro/Student/Services/Student_Services.dart';
import 'package:hostel_pro/Student/display_Student.dart';

class StudList extends StatefulWidget {
  String name,
      // parname,
      email,
      mobile,
      altermobile,
      birth,
      clas,
      gender,
      address,
      password;

  StudList({
    super.key,
    required this.name,
    // required this.parname,
    required this.email,
    required this.mobile,
    required this.altermobile,
    required this.birth,
    required this.clas,
    required this.gender,
    required this.address,
    required this.password,
  });

  @override
  State<StudList> createState() => _StudListState();
}

class _StudListState extends State<StudList> {
  late String name;

  StudentService studentService = StudentService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students List"),
      ),
      body: FutureBuilder(
        future: studentService.getAllstudent(),
        builder: ((context, snapshot) {
          // print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const SizedBox(
                        height: double.infinity, child: Icon(Icons.person)),
                    title: Text(
                      snapshot.data![index]['stdname'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      snapshot.data![index]['email'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DisplayPage(
                                        id: snapshot.data![index]['id']),
                                  ));
                            },
                            icon: const Icon(
                                CupertinoIcons.arrowshape_turn_up_right)),
                        IconButton(
                            onPressed: () {
                              StudentService.deleteStudent(
                                      snapshot.data![index]['id'])
                                  .then((response) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.purple,
                                    content: Row(
                                      children: const [
                                        Icon(
                                          Icons.task_alt,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Student Deleted Successfully !"),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
