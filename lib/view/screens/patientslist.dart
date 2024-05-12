// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/view/screens/patientsdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        "Patients List",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 118, 115, 115)),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height*0.84,
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
                        print(selectdate);
                        print(doctorname);

                        if (snapshot.hasData) {
                          if (snapshot.data!.docs.isNotEmpty) {
                            hasPatients = true;
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final patietsdata =
                                      snapshot.data!.docs[index].data();
                                  print("${patietsdata['date']}ppppppppppp");
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
                                              255, 236, 240, 240),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
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
                                                  color: Color.fromARGB(
                                                      255, 0, 148, 149),
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                                  'patientname']
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
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
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                        }
                        return Center(
                          child: hasPatients
                              ? Container()
                              : Text(
                                  textAlign: TextAlign.center,
                                  'No patients found for $doctorname on ${DateFormat('dd-MM-yyyy').format(selectdate)}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
