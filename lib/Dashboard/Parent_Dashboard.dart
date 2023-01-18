// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/Drawers/Parent_Drawer.dart';

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({super.key});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: const ParentDrawerPage(),
    );
  }
}
