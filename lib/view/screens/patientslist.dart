// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/newappointment/bloc/newappointment_bloc.dart';
import 'package:doctors_book_app/view/screens/bottomnaigation.dart';
import 'package:doctors_book_app/view/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/patientsdetails.dart';
import 'package:doctors_book_app/view/widgets/cancellingbutton.dart';
import 'package:doctors_book_app/view/widgets/common_popup.dart';

class PatientListWrapper extends StatelessWidget {
  const PatientListWrapper({
    Key? key,
    required this.selectdate,
    required this.doctorname,
  }) : super(key: key);
  final DateTime selectdate;
  final String doctorname;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewappointmentBloc(),
      child: PatientsList(
        selectdate: selectdate,
        doctorname: doctorname,
      ),
    );
  }
}

class PatientsList extends StatelessWidget {
  PatientsList({
    Key? key,
    required this.selectdate,
    required this.doctorname,
  }) : super(key: key);
  final DateTime selectdate;
  final String doctorname;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    bool hasPatients = false;
    final cancelappo = BlocProvider.of<NewappointmentBloc>(context);

    return BlocListener<NewappointmentBloc, NewappointmentState>(
      listener: (context, state) {
        if (state is Cancelappointmentloading) {
          LoadingDialog.show(context);
        } else if (state is Cancelappointmenterror) {
          LoadingDialog.hide(context);
        } else if (state is Cancelappointmentsuccess) {
          LoadingDialog.hide(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Appointment canceled"),
            ),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => BottomNavigationWrapper()),
              (route) => false);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: 37,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 186, 183, 183)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Color.fromARGB(255, 151, 151, 150),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Text("Patients List",
                            style: Textstyles.pagetitlestyle),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(user!.uid)
                            .collection("patients")
                            .where("doctorname", isEqualTo: doctorname)
                            .where("date", isEqualTo: selectdate)
                            .orderBy("time")
                            .snapshots(),
                        builder: (context, snapshot) {
                          // print(selectdate);
                          // print(doctorname);
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            if (snapshot.data!.docs.isNotEmpty) {
                              hasPatients = true;
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final patietsdata =
                                        snapshot.data!.docs[index].data();
                                    // print("${patietsdata['date']}ppppppppppp");
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => PatientsDetails(
                                                    patietsdata: patietsdata)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 247, 250, 250),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    patietsdata['time'],
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 0, 148, 149)),
                                                  ),
                                                  const Icon(
                                                    Icons.book,
                                                    color: Colorpalette
                                                        .primarycolor,
                                                  ),
                                                ],
                                              ),
                                              const Divider(
                                                color: Colors.black,
                                                thickness: 0.5,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.person,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 17,
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              "Patient Name: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black38),
                                                            ),
                                                            Text(
                                                              patietsdata[
                                                                  'patientname'],
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black45),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              "Patient Age: ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black38,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            Text(
                                                              " ${patietsdata['age']} years",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black45,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                child: Center(
                                                  child: Cancelbutton(
                                                    buttontext: "cancel",
                                                    onpressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              ConfirmAlert(
                                                                msg:
                                                                    "Do you want to cancel this appointment ?",
                                                                icon: Icons
                                                                    .cancel_presentation_rounded,
                                                                iconColor:
                                                                    const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        231,
                                                                        93,
                                                                        127),
                                                                onConfirm: () {
                                                                  cancelappo.add(
                                                                      Cancelappointment(
                                                                          uuid:
                                                                              patietsdata['uid']));
                                                                },
                                                                onReject: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                title: 'CANCEL',
                                                              ));
                                                    },
                                                  ),
                                                ),
                                              )
                                              //
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }
                          return Container(
                            child: hasPatients
                                ? Container()
                                : Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/checkup-with-doctor-n8ChwgYoAQ.svg"),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'No patients found for $doctorname on ${DateFormat('dd-MM-yyyy').format(selectdate)}',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 124, 124, 124),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
