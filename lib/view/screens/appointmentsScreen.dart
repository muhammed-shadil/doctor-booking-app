import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:doctors_book_app/view/screens/patientslist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmetsScreen extends StatefulWidget {
  const AppointmetsScreen({super.key});

  @override
  State<AppointmetsScreen> createState() => _AppointmetsScreenState();
}

class _AppointmetsScreenState extends State<AppointmetsScreen> {
  DateTime ss = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Appointment"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    DateFormat('dd-MM-yyyy').format(ss),
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        BottomPicker.date(
                          buttonSingleColor:
                              const Color.fromARGB(255, 0, 148, 149),
                          pickerTitle: const Text(
                            'Set your Birthday',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 148, 149),
                            ),
                          ),
                          dateOrder: DatePickerDateOrder.dmy,
                          initialDateTime: DateTime.now(),
                          maxDateTime: DateTime(DateTime.now().year,
                              DateTime.now().month + 1, DateTime.now().day),
                          minDateTime: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day - 1),
                          pickerTextStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 86, 86),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          onChange: (index) {
                            setState(() {
                              ss = index;
                            });
                            print(ss);
                          },
                          onSubmit: (index) {
                            print(ss);
                          },
                          bottomPickerTheme: BottomPickerTheme.plumPlate,
                        ).show(context);
                      },
                      icon: const Icon(Icons.calendar_month)),
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("doctors")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final doctorsdata = snapshot.data!.docs[index].data();
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PatientsList(
                                          selectdate: ss,
                                          doctorname: doctorsdata['doctorname'],
                                        )));
                          },
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 15),
                              child: Row(
                                children: [
                                  (doctorsdata['image'] == null)
                                      ? const Expanded(
                                          flex: 1,
                                          child: CircleAvatar(
                                            child: Icon(Icons.person),
                                          ))
                                      : Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 50,
                                            height: 70,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Image.network(
                                              doctorsdata['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doctorsdata['doctorname']
                                              .toString()
                                              .toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Text(
                                            doctorsdata['speciality'],
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 121, 120, 120)),
                                          ),
                                        ),
                                        Text(
                                          doctorsdata['time'],
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 75, 74, 74)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Color.fromARGB(255, 0, 148, 149),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}
