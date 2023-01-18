// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hostel_pro/Drawers/Rector_Drawer.dart';

class RectorDashboard extends StatefulWidget {
  const RectorDashboard({super.key});

  @override
  State<RectorDashboard> createState() => _DashboardState();
}

class _DashboardState extends State<RectorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: const DrawerPage(),
    );
  }
}
