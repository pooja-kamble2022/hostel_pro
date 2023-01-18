// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/Student/Services/Student_Services.dart';
import 'package:hostel_pro/Student/display_Student.dart';
import 'package:intl/intl.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({
    super.key,
    required this.studentId,
  });
  final int studentId;
  @override
  State<UpdateStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<UpdateStudent> {
  late DateTime selectedDate;
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _parnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _alterController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? gender;
  @override
  void initState() {
    super.initState();
    gender = "male";
    _genderController.text = "male";
    StudentService.getSingleStudent(widget.studentId).then((response) {
      _nameController.text = response['stdname'];
      // _parnameController.text = response['parname'];
      _phoneController.text = response['mobile'];
      _alterController.text = response['altermobile'];
      _mailController.text = response['email'];
      _birthController.text = response['birth'];
      _classController.text = response['stdclass'];
      _genderController.text = response['gender'];
      _addressController.text = response['address'];
      _passwordController.text = response['password'];
      // print(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 190, child: Image.asset("assets/reg.png")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Name Cannot Be Null!' : null,
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        hintText: "Name please",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.purple,
                        ),
                        labelText: "Name"),
                  ),
                ),
                const SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     validator: (value) =>
                //         value!.isEmpty ? 'Name Cannot Be Null!' : null,
                //     controller: _parnameController,
                //     decoration: const InputDecoration(
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(20.0),
                //           ),
                //         ),
                //         hintText: "parent Name please",
                //         prefixIcon: Icon(
                //           Icons.person,
                //           color: Colors.purple,
                //         ),
                //         labelText: "parent Name"),
                //   ),
                // ),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length > 10 ||
                          value.length < 10) {
                        return "Please Enter Valid Mobile Number";
                      }
                      return null;
                    },

                    // value!.isEmpty ? 'Mobile Number Cannot Be Null!' : null,
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        hintText: "+91 -",
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.purple,
                        ),
                        labelText: "Mobile No"),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length > 10 ||
                          value.length < 10) {
                        return "Please Enter Valid Mobile Number";
                      }
                      return null;
                    },
                    controller: _alterController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        hintText: "+91 -",
                        prefixIcon: Icon(
                          Icons.phone_in_talk,
                          color: Colors.purple,
                        ),
                        labelText: "parents Mobile No"),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Email Cannot Be Null!' : null,
                    controller: _mailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        hintText: "user@gmail.com",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.purple,
                        ),
                        labelText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Date Cannot Be Null!' : null,
                    controller: _birthController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      labelText: 'Select Date',
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: Colors.purple,
                      ),
                    ),
                    // initialValue: DateFormat('dd-MM-YYYY').format(DateTime.now()),
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          _birthController.text = DateFormat('d-MM-y')
                              .format(selectedDate)
                              .toString();
                        }
                        return null;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter Valid Class' : null,
                    controller: _classController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        hintText: "Class please",
                        prefixIcon: Icon(
                          Icons.school,
                          color: Colors.purple,
                        ),
                        labelText: "Class"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Select Gender:",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      RadioListTile(
                        title: const Text("Male"),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          // print(_genderController.text);

                          setState(() {
                            gender = value.toString();
                            _genderController.text = gender.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text("Female"),
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          // print(_genderController.text);

                          setState(() {
                            gender = value.toString();
                            _genderController.text = gender.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Address Cannot Be Null!' : null,
                    controller: _addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      hintText: "Enter Your Address please",
                      labelText: "Address",
                      prefixIcon: Icon(
                        Icons.home,
                        color: Colors.purple,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // validator: (value) =>
                    //     value!.isEmpty ? 'Password Cannot Be Null!' : null,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        hintText: "password please",
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Colors.purple,
                        ),
                        labelText: "password"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // print(_nameController.text);
                        // print(_mailController.text);
                        // print(_phoneController.text);
                        // print(_alterController.text);
                        // print(_classController.text);
                        // print(_passwordController.text);
                        StudentService.updateStudent(
                          widget.studentId,
                          _nameController.text,
                          // _parnameController.text,
                          _mailController.text,
                          _phoneController.text,
                          _alterController.text,
                          _classController.text,
                          _birthController.text,
                          _genderController.text,
                          _addressController.text,
                          _passwordController.text,
                        ).then((response) {
                          if (response['code'] == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DisplayPage(id: widget.studentId),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.purple,
                              content: Row(
                                children: [
                                  const Icon(
                                    Icons.task_alt,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(response['message']),
                                ],
                              ),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.purple,
                              content: Row(
                                children: [
                                  const Icon(
                                    Icons.task_alt,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(response['message']),
                                ],
                              ),
                            ));
                          }
                        });
                      }
                    },
                    child: const Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
