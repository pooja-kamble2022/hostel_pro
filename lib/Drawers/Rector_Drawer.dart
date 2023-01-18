// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/Parents/Add_Parent.dart';
import 'package:hostel_pro/Parents/Parent_List.dart';
import 'package:hostel_pro/Student/Student_List.dart';
import 'package:hostel_pro/Student/add_student.dart';
import 'package:hostel_pro/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _parnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _alterController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? name;
  String? email;

  getrectordetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name');
    email = prefs.getString('email');

    setState(() {
      name;
      email;
    });
  }

  @override
  void initState() {
    super.initState();

    getrectordetails();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.asset("assets/rector.png", fit: BoxFit.cover),
                ),
              ),
              accountName: Text(name.toString()),
              accountEmail: Text(email.toString())),
          ExpansionTile(
            trailing: const Icon(Icons.expand_more),
            title: const Text("Student"),
            children: [
              Card(
                  child: ListTile(
                title: const Text("Student Registration"),
                trailing: const Icon(Icons.person_add),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddStudent(
                                name: _nameController.text,
                                // parname: _parnameController.text,
                                email: _mailController.text,
                                mobile: _phoneController.text,
                                birth: _birthController.text,
                                clas: _classController.text,
                                altermobile: _alterController.text,
                                gender: _genderController.text,
                                address: _addressController.text,
                                password: _passwordController.text,
                              )));
                },
              )),
              Card(
                  child: ListTile(
                title: const Text("Students List"),
                trailing: const Icon(Icons.sort),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudList(
                                name: _nameController.text,
                                // parname: _parnameController.text,
                                email: _mailController.text,
                                mobile: _phoneController.text,
                                birth: _birthController.text,
                                clas: _classController.text,
                                altermobile: _alterController.text,
                                gender: _genderController.text,
                                address: _addressController.text,
                                password: _passwordController.text,
                              )));
                },
              )),
              // Card(
              //     child: ListTile(
              //   title: const Text("Student Login"),
              //   trailing: const Icon(Icons.login),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const StudLogin()));
              //   },
              // )),
            ],
          ),
          ExpansionTile(
            trailing: const Icon(Icons.expand_more),
            title: const Text("Parents"),
            children: [
              Card(
                child: ListTile(
                  title: const Text("Parent Registration"),
                  trailing: const Icon(Icons.person_add),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddParent(
                                  stdname: _nameController.text,
                                  // parname: _parnameController.text,
                                  email: _mailController.text,
                                  mobile: _phoneController.text,
                                  altermobile: _alterController.text,
                                  birth: _birthController.text,
                                  stdclass: _classController.text,
                                  gender: _genderController.text,
                                  address: _addressController.text,
                                  password: _passwordController.text,
                                )));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text("Parent List"),
                  trailing: const Icon(Icons.sort),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParentList(
                                  stdname: _nameController.text,
                                  // parname: _parnameController.text,
                                  email: _mailController.text,
                                  mobile: _phoneController.text,
                                  birth: _birthController.text,
                                  stdclass: _classController.text,
                                  altermobile: _alterController.text,
                                  gender: _genderController.text,
                                  address: _addressController.text,
                                  password: _passwordController.text,
                                )));
                  },
                ),
              ),
              // Card(
              //     child: ListTile(
              //   title: const Text("Parent Login"),
              //   trailing: const Icon(Icons.login),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const ParentLogin()));
              //   },
              // )),
            ],
          ),
          Card(
            child: ListTile(
              title: const Text("Logout"),
              trailing: const Icon(
                Icons.logout_outlined,
                color: Colors.purple,
              ),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('isAuthenticated', 'false');
                if (!mounted) {
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
