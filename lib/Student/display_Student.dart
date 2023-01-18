// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/Student/Services/Student_Services.dart';
import 'package:hostel_pro/Student/Update_Student.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key, required this.id});
  final int id;

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  bool pageLoading = true;
  String name = "";
  String parname = "";
  String email = "";
  String mobile = "";
  String altermobile = "";
  String birth = "";
  String stdclass = "";
  String gender = "";
  String address = "";
  String password = "";
  @override
  void initState() {
    super.initState();
    // Api Call goes here
    StudentService.getSingleStudent(widget.id).then((data) {
      // print(data);
      name = data['stdname'].toString();
      parname = data['parname'].toString();
      email = data['email'].toString();
      mobile = data['mobile'].toString();
      altermobile = data['altermobile'].toString();
      birth = data['birth'].toString();
      stdclass = data['stdclass'].toString();
      gender = data['gender'].toString();
      address = data['address'].toString();
      password = data['password'].toString();
      pageLoading = false;
      setState(() {});
    });
  }

  StudentService studentService = StudentService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Of Students"),
      ),
      body: pageLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 200,
                        width: 400,
                        child: Image.asset("assets/display2.png")),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.person,
                              color: Colors.purple,
                            )),
                        title: Text(
                          name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.person,
                              color: Colors.purple,
                            )),
                        title: Text(
                          parname,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.purple,
                            )),
                        title: Text(
                          email,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.call,
                              color: Colors.purple,
                            )),
                        title: Text(
                          mobile,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.call,
                              color: Colors.purple,
                            )),
                        title: Text(
                          altermobile,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.purple,
                            )),
                        title: Text(
                          birth,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.school,
                              color: Colors.purple,
                            )),
                        title: Text(
                          stdclass,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.person,
                              color: Colors.purple,
                            )),
                        title: Text(
                          gender,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.home,
                              color: Colors.purple,
                            )),
                        title: Text(
                          address,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.lock_open,
                              color: Colors.purple,
                            )),
                        title: Text(
                          password,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateStudent(
                                studentId: widget.id,
                              ),
                            ),
                          );
                        },
                        child: const Text("Update")),
                  ],
                ),
              ),
            ),
    );
  }
}
