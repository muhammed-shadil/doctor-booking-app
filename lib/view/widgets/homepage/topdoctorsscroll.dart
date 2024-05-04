// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class doctorsverticalscroll extends StatelessWidget {
  const doctorsverticalscroll({
    Key? key,
    required this.image,
    required this.speciality,
    required this.doctorname,
  }) : super(key: key);
  final String image;
  final String speciality;
  final String doctorname;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          children: [
            Container(
              width: 95,
              height: 117,
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    // "assets/3.jpeg",
                    image,
                    fit: BoxFit.cover,
                  )
                  //  Image.network(
                  //   userData['image'],
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
            Text(
              // "Dr.arshak patel",
              doctorname,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: (doctorname.length >= 17) ? 13 : 16,
                  color: Color.fromARGB(255, 111, 104, 104)),
            ),
            Text(speciality,
                style: TextStyle(
                    color: Color.fromARGB(255, 158, 153, 153),
                    fontSize: (speciality.length >= 17) ? 12 : 15)),
          ],
        ),
      ),
    );
  }
}
