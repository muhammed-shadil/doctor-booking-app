// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 235, 235, 236),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsdatails['doctorname'],
                  style:  TextStyle(
                      fontSize: 22.sp, color: const Color.fromARGB(255, 64, 63, 63)),
                ),
                Text(
                  doctorsdatails['qualifications'],
                  style:  TextStyle(
                      fontSize: 15.sp, color: const Color.fromARGB(255, 92, 91, 91)),
                ),
                Text(
                  doctorsdatails['speciality'],
                  style:  TextStyle(
                      fontSize: 15.sp, color: const Color.fromARGB(255, 92, 91, 91)),
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
                    style:  TextStyle(
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 158, 156, 156)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
