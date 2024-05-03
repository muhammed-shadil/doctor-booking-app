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
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          children: [
            Icon(
              icon,
              size: 34,
              color: const Color.fromARGB(255, 0, 148, 149),
            ),
            Text(
              firsttext,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color:Color.fromARGB(255, 99, 95, 95), ),
            ),
            Text(
              secondtext,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color:Color.fromARGB(255, 99, 95, 95),),
            ),
            Text(thirdtext,style: const TextStyle(fontSize: 14, color:Color.fromARGB(255, 122, 118, 118),),
            )
          ],
        ),
      ),
    );
  }
}
