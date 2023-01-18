// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/Auth/Services.dart';
import 'package:hostel_pro/Dashboard/Parent_Dashboard.dart';

class ParentLogin extends StatefulWidget {
  const ParentLogin({super.key});

  @override
  State<ParentLogin> createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
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
              Image.asset("assets/login2.png"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Email Cannot Be Null!' : null,
                  controller: _mailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email please",
                      labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Password Cannot Be Null!' : null,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password please",
                      labelText: "Password"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthService.loginUser(
                        _mailController.text,
                        _passwordController.text,
                      ).then((response) {
                        if (response['isLogin'] == true) {
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
                                  Text("Welcome To Dashboard !"),
                                ],
                              ),
                            ),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ParentDashboard()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
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
