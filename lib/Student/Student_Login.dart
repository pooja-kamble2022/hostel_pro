// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/Auth/Services.dart';
import 'package:hostel_pro/Dashboard/Student_Dashboard.dart';

class StudLogin extends StatefulWidget {
  const StudLogin({super.key});

  @override
  State<StudLogin> createState() => _StudLoginState();
}

class _StudLoginState extends State<StudLogin> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/login.png"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Email Cannot Be Null!' : null,
                  controller: _mailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email please",
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.attach_email,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Password Cannot Be Null!' : null,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password please",
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        color: Colors.purple,
                      )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthService.loginUser(
                        _mailController.text,
                        _passwordController.text,
                      ).then((response) {
                        // return;
                        if (response['isLogin'] == false) {
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
                                  Text("Credential Does Not Match !"),
                                ],
                              ),
                            ),
                          );
                        } else {
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
                                  Text("Welcome to Dashboard !"),
                                ],
                              ),
                            ),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const StudentDashboard()));
                        }
                      });
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
