// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Specialistverticalscroll extends StatelessWidget {
  const Specialistverticalscroll({
    Key? key,
    required this.firsttext,
    required this.secondtext,
    required this.thirdtext,
    required this.icon,
  }) : super(key: key);
  final String firsttext;
  final String secondtext;
  final String thirdtext;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 9),
        child: Column(
          children: [
            SizedBox(
              width: firsttext.length >= 17 ? 35 : 40,
              height: firsttext.length >= 17 ? 35 : 40,
              child: Image.asset(icon),
            ),
            Text(
              firsttext,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 99, 95, 95),
              ),
            ),
            Text(
              secondtext,
              style: TextStyle(
                fontSize: firsttext.length >= 17 ? 10 : 12,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 99, 95, 95),
              ),
            ),
            Text(
              thirdtext,
              style: const TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 122, 118, 118),
              ),
            )
          ],
        ),
      ),
    );
  }
}