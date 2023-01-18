// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hostel_pro/Parents/Display_Parent.dart';
import 'package:hostel_pro/Parents/Services/Parent_Services.dart';

class ParentList extends StatefulWidget {
  String stdname,
      // parname,
      email,
      mobile,
      altermobile,
      birth,
      stdclass,
      gender,
      address,
      password;

  ParentList({
    super.key,
    required this.stdname,
    // required this.parname,
    required this.email,
    required this.mobile,
    required this.altermobile,
    required this.birth,
    required this.stdclass,
    required this.gender,
    required this.address,
    required this.password,
  });

  @override
  State<ParentList> createState() => _ParentListState();
}

class _ParentListState extends State<ParentList> {
  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parents List"),
      ),
      body: FutureBuilder<List>(
        future: ParentService.getAllParent(),
        builder: ((context, snapshot) {
          // print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const SizedBox(
                        height: double.infinity, child: Icon(Icons.person)),
                    title: Text(
                      snapshot.data![index]['stdname'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      snapshot.data![index]['email'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ParDisplay(
                                        id: snapshot.data![index]['id']),
                                  ));
                            },
                            icon: const Icon(
                                CupertinoIcons.arrowshape_turn_up_right)),
                        IconButton(
                            onPressed: () {
                              ParentService.deleteParent(
                                      snapshot.data![index]['id'])
                                  .then((response) {
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
                                        Text("Parent Deleted Successfully !"),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
