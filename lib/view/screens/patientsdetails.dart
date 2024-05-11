// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/view/widgets/patientrowdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientsDetails extends StatelessWidget {
  const PatientsDetails({
    Key? key,
    required this.patietsdata,
  }) : super(key: key);
  final Map<String, dynamic> patietsdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      "Patients Details",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 118, 115, 115)),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.0, right: 8),
                    child: Icon(
                      Icons.person,
                      size: 28,
                      color: Color.fromARGB(255, 0, 148, 149),
                    ),
                  ),
                  Text(
                    "Personal information",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 100, 98, 98)),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    patientRow(
                        firstname: "Patientname :",
                        secondname: patietsdata['patientname']),
                    patientRow(
                        firstname: "Age                :", secondname: patietsdata['age']),
                    patientRow(
                        firstname: "Gender           :",
                        secondname: patietsdata['gender']),
                    patientRow(
                        firstname: "Email             :", secondname: patietsdata['email']),
                    patientRow(
                        firstname: "Phone            :", secondname: patietsdata['phone']),
                  ],
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.0, right: 8),
                    child: Icon(
                      Icons.av_timer,
                      size: 28,
                      color: Color.fromARGB(255, 0, 148, 149),
                    ),
                  ),
                  Text(
                    "Visit time",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 100, 98, 98)),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    patientRow(
                        firstname: "Doctor           :",
                        secondname: patietsdata['doctorname']),
                    patientRow(
                        firstname: "Time              :", secondname: patietsdata['time']),
                    // patientRow(
                    //     firstname: "Date              :",
                    //     secondname: patietsdata['date']),
                  ],
                ),
              ),

              // Text(patietsdata['email']),
              // // Text(patietsdata['date']),
              // Text(patietsdata['time']),
            ],
          ),
        ),
      ),
    );
  }
}
