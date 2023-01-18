// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentDrawerPage extends StatefulWidget {
  const ParentDrawerPage({super.key});

  @override
  State<ParentDrawerPage> createState() => _ParentDrawerState();
}

class _ParentDrawerState extends State<ParentDrawerPage> {
  String? name;
  String? email;

  getparentdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name');
    email = prefs.getString('email');
    // print(name);
    // print(email);
    setState(() {
      name;
      email;
    });
  }

  @override
  void initState() {
    super.initState();

    getparentdetails();
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
          //   title: const Text("Parent Login"),
          //   trailing: const Icon(
          //     Icons.login,
          //     color: Colors.purple,
          //   ),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const ParentLogin()));
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
