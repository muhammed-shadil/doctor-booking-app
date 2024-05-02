import 'package:flutter/material.dart';

class Specialistverticalscroll extends StatelessWidget {
  const Specialistverticalscroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 165, 165, 164)),
      child: const Padding(
        padding: EdgeInsets.only(top: 6),
        child: Column(
          children: [
            Icon(
              Icons.wheelchair_pickup_sharp,
              size: 34,
              color: Color.fromARGB(255, 0, 148, 149),
            ),
            Text(
              "Cardeo ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(
              "Specialist",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text("12 doctors")
          ],
        ),
      ),
    );
  }
}
