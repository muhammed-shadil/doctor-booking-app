// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookappointmentbutton extends StatelessWidget {
  const Bookappointmentbutton({
    Key? key,
    required this.buttontext,
    this.onpressed,
  }) : super(key: key);
  final String buttontext;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 60,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color.fromARGB(255, 115, 118, 145),
        ),
        child: Text(
          buttontext,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
