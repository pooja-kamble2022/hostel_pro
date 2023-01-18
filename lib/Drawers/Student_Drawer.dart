// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentDrawerPage extends StatefulWidget {
  const StudentDrawerPage({super.key});

  @override
  State<StudentDrawerPage> createState() => _StudentDrawerPageState();
}

class _StudentDrawerPageState extends State<StudentDrawerPage> {
  String? name;
  String? email;

  getdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    email = prefs.getString('email');
    setState(() {
      name;
      email;
    });
    // print(name);
    // print(email);
  }

  @override
  void initState() {
    super.initState();

    getdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(48),
                child: Image.asset(
                  "assets/rector.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            accountName: Text(name.toString()),
            accountEmail: Text(email.toString()),
          ),
          // Card(
          //     child: ListTile(
          //   title: const Text("Student Login"),
          //   trailing: const Icon(
          //     Icons.login,
          //     color: Colors.purple,
          //   ),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const StudLogin()));
          //   },
          // )),
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
