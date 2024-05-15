import 'package:doctors_book_app/model/patientmodel.dart';
import 'package:doctors_book_app/view/screens/bottomnaigation.dart';
import 'package:doctors_book_app/view/widgets/successpop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:intl/intl.dart';
import 'package:telephony/telephony.dart';

 class Functions{

  final Telephony telephony = Telephony.instance;
  confirmdialoage(context,patient patientdetails){
     showDialog(
              context: context,
              builder: (context) => Successpop(
                  msg: "Your appointment booking successfully scheduled.",
                  icon: FontAwesomeIcons.checkToSlot,
                  iconColor: const Color.fromARGB(255, 44, 176, 176),
                  onConfirm: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const BottomNavigationWrapper()),
                        (route) => false);
                    telephony.sendSmsByDefaultApp(
                        to: "${patientdetails.phone}",
                        message:
                            "Dear ${patientdetails.patientname} \nThank you for booking your appointment with ${patientdetails.doctorname} on ${DateFormat('dd-MM-yyyy').format(patientdetails.date!)} at ${patientdetails.time}. Your booking is confirmed. \nBest regards,\nMEDICO");
                  },
                  onReject: () {}));
  }
}