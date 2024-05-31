// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({
    Key? key,
    required this.buttontext,
    this.onpressed,
  }) : super(key: key);
  final String buttontext;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 148, 149),
      ),
      child: Text(
        buttontext,
        style: TextStyle(
            color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w400),
      ),
    );
  }
}
