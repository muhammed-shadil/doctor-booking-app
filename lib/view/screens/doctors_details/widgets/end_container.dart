// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/view/screens/doctors_details/widgets/appoinment.dart';
import 'package:doctors_book_app/view/screens/new_appointment/new_appointment_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Endcontainer extends StatelessWidget {
  const Endcontainer({
    Key? key,
    required this.doctorsdatails,
  }) : super(key: key);

  final Map<String, dynamic> doctorsdatails;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20,left: 25,right: 25,bottom: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        color: Color.fromARGB(255, 235, 235, 236),
      ),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorsdatails['doctorname'],
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: const Color.fromARGB(255, 64, 63, 63)),
                  ),
                  Text(
                    doctorsdatails['qualifications'],
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: const Color.fromARGB(255, 92, 91, 91)),
                  ),
                  Text(
                    doctorsdatails['speciality'],
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: const Color.fromARGB(255, 92, 91, 91)),
                  )
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About doctor",
                    style: TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 64, 63, 63)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      doctorsdatails['about'],
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 158, 156, 156)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 235, 235, 236),
              padding: const EdgeInsets.symmetric( vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Working time",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: const Color.fromARGB(255, 64, 63, 63)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(doctorsdatails['time']),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text("${doctorsdatails['date']}".toUpperCase()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Bookappointmentbutton(
                        buttontext: "Book appointment",
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => NewAppointmentScreenWrapper(
                                      doctorname: doctorsdatails['doctorname'],
                                      doctordates: doctorsdatails['date'])));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
