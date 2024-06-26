// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Middlecontainer extends StatelessWidget {
  const Middlecontainer({
    Key? key,
    required this.doctorsdatails,
  }) : super(key: key);

  final Map<String, dynamic> doctorsdatails;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      height:
       MediaQuery.of(context).size.height * 0.11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 237, 235, 235),
            child: Icon(
              Icons.people_alt,
              color: Colorpalette.primarycolor,
              size: 25,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorsdatails['nopatients'],
                style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color.fromARGB(255, 92, 91, 91)),
              ),
              const Text("Patients",
                  style: TextStyle(color: Color.fromARGB(255, 148, 146, 146)))
            ],
          ),
          const VerticalDivider(),
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 237, 235, 235),
            child: Icon(
              Icons.badge,
              color: Colorpalette.primarycolor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(doctorsdatails['experince'],
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color.fromARGB(255, 92, 91, 91))),
              const Text("Experiences",
                  style: TextStyle(color: Color.fromARGB(255, 148, 146, 146)))
            ],
          ),
        ],
      ),
    );
  }
}
