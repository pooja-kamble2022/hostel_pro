// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostel_pro/Drawers/Student_Drawer.dart';
import 'package:hostel_pro/Student/passes/gatepass.dart';
import 'package:hostel_pro/Student/passes/outpass.dart';
import 'package:lottie/lottie.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  bool pageLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        pageLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: const StudentDrawerPage(),
      body: pageLoading
          ? Center(
              child: Lottie.asset(
                "assets/Loading.json",
                height: 50,
              ),
            )
          : SingleChildScrollView(
              child: Column(children: [
                CustomButton(
                    color: Colors.green.shade300,
                    title: "GATE PASS",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GatePassPage(),
                          ));
                    }),
                CustomButton(
                    color: Colors.orange.shade300,
                    title: "OUT PASS",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OutPassPage(),
                          ));
                    }),

                const SizedBox(
                  height: 5,
                ),

                // )

                // Center(
                //   child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const CurrentLocation(),
                //             ));
                //       },
                //       child: const Text("Use Current Location")),
                // )
              ]),
            ),
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        // child: Shimmer.fromColors(
        //   baseColor: Colors.grey.withOpacity(0.25),
        //   highlightColor: Colors.white.withOpacity(0.6),
        //   period: const Duration(seconds: 2),
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 190,
            width: 400,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
