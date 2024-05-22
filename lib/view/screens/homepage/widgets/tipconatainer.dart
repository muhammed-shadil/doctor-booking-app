// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Autoscrollcontainer extends StatelessWidget {
  const Autoscrollcontainer({
    Key? key,
    required this.title,
    required this.describtion,
  }) : super(key: key);
  final String title;
  final String describtion;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 161, 157, 157),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 14, right: 2),
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Colorpalette.primarycolor, width: 3))),
              child: Text(
                describtion,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 150, 149, 149),
                ),
              ))
        ],
      ),
    );
  }
}
