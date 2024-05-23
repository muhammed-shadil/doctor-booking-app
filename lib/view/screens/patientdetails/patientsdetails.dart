// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/patientdetails/widgets/patientrowdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      border:
                          Border.all(color: Colorpalette.primarybordercolor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 22,
                          color: Colorpalette.backarrowcolor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text("Patients Details",
                        style: Textstyles.pagetitlestyle),
                  )
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 13.0, right: 8),
                    child: Icon(
                      Icons.person,
                      size: 28,
                      color: Colorpalette.primarycolor,
                    ),
                  ),
                  Text(
                    "Personal information",
                    style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 100, 98, 98)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    patientRow(
                        firstname: "Patientname :",
                        secondname: patietsdata['patientname']),
                    patientRow(
                        firstname: "Age                :",
                        secondname: patietsdata['age']),
                    patientRow(
                        firstname: "Gender           :",
                        secondname: patietsdata['gender']),
                    patientRow(
                        firstname: "Email             :",
                        secondname: patietsdata['email']),
                    patientRow(
                        firstname: "Phone            :",
                        secondname: patietsdata['phone']),
                  ],
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 13.0, right: 8),
                    child: Icon(
                      Icons.av_timer,
                      size: 28,
                      color: Colorpalette.primarycolor,
                    ),
                  ),
                  Text(
                    "Visit time",
                    style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 100, 98, 98)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    patientRow(
                        firstname: "Doctor           :",
                        secondname: patietsdata['doctorname']),
                    patientRow(
                        firstname: "Time              :",
                        secondname: patietsdata['time']),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
