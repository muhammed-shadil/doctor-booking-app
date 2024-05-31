import 'package:doctors_book_app/model/patients_model.dart';
import 'package:doctors_book_app/view/screens/bottomnaigation.dart';
import 'package:doctors_book_app/view/widgets/success_pop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:intl/intl.dart';
import 'package:telephony/telephony.dart';

class Functions {
  confirmdialoage(context, patient patientdetails) {
    showDialog(
        context: context,
        builder: (context) => Successpop(
            msg: "Your appointment booking successfully scheduled.",
            icon: FontAwesomeIcons.checkToSlot,
            iconColor: const Color.fromARGB(255, 44, 176, 176),
            onConfirm: () {
              Telephony telephony = Telephony.instance;
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

List<int> parseAvailability(String availability) {
  Map<String, int> dayMap = {
    "sun": DateTime.sunday,
    "mon": DateTime.monday,
    "tue": DateTime.tuesday,
    "wed": DateTime.wednesday,
    "thu": DateTime.thursday,
    "fri": DateTime.friday,
    "sat": DateTime.saturday,
  };

  List<int> availableDays = [];

  List<String> ranges = availability.split(',');
  for (String range in ranges) {
    List<String> days = range.split('-');
    if (days.length == 1) {
      availableDays.add(dayMap[days[0].trim()]!);
    } else if (days.length == 2) {
      int start = dayMap[days[0].trim()]!;
      int end = dayMap[days[1].trim()]!;
      for (int i = start; i <= end; i++) {
        availableDays.add(i);
      }
    }
  }
  return availableDays;
}
