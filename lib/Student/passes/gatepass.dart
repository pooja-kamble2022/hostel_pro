import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class GatePassPage extends StatefulWidget {
  const GatePassPage({super.key});

  @override
  State<GatePassPage> createState() => _GatePassPageState();
}

class _GatePassPageState extends State<GatePassPage> {
  late DateTime selectedDate;
  TimeOfDay? selectedTime;
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _outtimeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" GATE PASS"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Lottie.asset(
                "assets/calendar.json",
                height: 250,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Name Cannot Be Null!' : null,
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name please",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      labelText: "Name"),
                ),
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
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.length > 10 ||
                        value.length < 10) {
                      return "Please Enter Valid Mobile Number";
                    }
                    return null;
                  },

                  // value!.isEmpty ? 'Mobile Number Cannot Be Null!' : null,
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "+91 -",
                      prefixIcon: Icon(
                        Icons.call,
                        color: Colors.purple,
                      ),
                      labelText: "Mobile No"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Date Cannot Be Null!' : null,
                  controller: _birthController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Date',
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.purple,
                    ),
                  ),
                  // initialValue: DateFormat('dd-MM-YYYY').format(DateTime.now()),
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        _birthController.text = DateFormat('d-MM-y')
                            .format(selectedDate)
                            .toString();
                      }
                      return null;
                    });
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Time Cannot Be Null!' : null,
                  controller: _timeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Out Time",
                      prefixIcon: Icon(
                        Icons.schedule,
                        color: Colors.purple,
                      )),
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                    ).then((selectedTime) {
                      if (selectedTime != null) {
                        _timeController.text = selectedTime.format(context);
                        // print(selectedTime);
                      }
                      return null;
                    });
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Time Cannot Be Null!' : null,
                  controller: _outtimeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "In Time",
                      prefixIcon: Icon(
                        Icons.schedule,
                        color: Colors.purple,
                      )),
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                    ).then((selectedTime) {
                      if (selectedTime != null) {
                        _outtimeController.text = selectedTime.format(context);
                        // print(selectedTime);
                      }
                      return null;
                    });
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Reason Cannot Be Null!' : null,
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Reason ??",
                    prefixIcon: Icon(
                      Icons.edit_note,
                      color: Colors.purple,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Address Cannot Be Null!' : null,
                  controller: _addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Where to go ??",
                    labelText: "Where To Go ?",
                    prefixIcon: Icon(
                      Icons.not_listed_location,
                      color: Colors.purple,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
