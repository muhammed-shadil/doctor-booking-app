// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/widgets/cancellingbutton.dart';
import 'package:doctors_book_app/view/widgets/common_popup.dart';
import 'package:doctors_book_app/view/widgets/patientrowdetails.dart';
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
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text("Patients Details",
                        style: Textstyles.pagetitlestyle),
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
                      color: Colorpalette.primarycolor,
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
              const Row(
                children: [
                  Padding(
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
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 100, 98, 98)),
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
                    // patientRow(
                    //     firstname: "Date              :",
                    //     secondname: patietsdata['date']),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Cancelbutton(
                    buttontext: "cancel",
                    onpressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => ConfirmAlert(
                      //           msg: "Do you want to cancel this appointment ?",
                      //           icon: Icons.cancel_presentation_rounded,
                      //           iconColor:
                      //               const Color.fromARGB(255, 231, 93, 127),
                      //           onConfirm: () {
                      //             Navigator.pop(context);
                      //           },
                      //           onReject: () {
                      //             Navigator.pop(context);
                      //           },
                      //           title: 'CANCEL',
                      //         ));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
