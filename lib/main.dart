import 'package:flutter/material.dart';
import 'package:hostel_pro/Auth/Services.dart';
import 'package:hostel_pro/Dashboard/Parent_Dashboard.dart';
import 'package:hostel_pro/Dashboard/Rector_Dashboard.dart';
import 'package:hostel_pro/Dashboard/Student_Dashboard.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(
        primarySwatch: Colors.purple, scaffoldBackgroundColor: Colors.white),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset("assets/login5.json", height: 300),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Email Cannot Be Null!' : null,
                    controller: _mailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email please",
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.attach_email_outlined,
                          color: Colors.purple,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Password Should Not Be Null!' : null,
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
                              _mailController.text, _passwordController.text)
                          .then((resp) {
                        if (resp['isLogin'] == true) {
                          if (resp['userType'] == "parent") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ParentDashboard()));
                          } else if (resp['userType'] == "student") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const StudentDashboard()));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RectorDashboard()));
                          }
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
                                  // Text(resp['message']),
                                  Text("Credential Does Not Match !"),
                                ],
                              ),
                            ),
                          );
                        }
                        // print("s");
                        // print(resp);
                      });
                    }
                  },
                  child: const Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
