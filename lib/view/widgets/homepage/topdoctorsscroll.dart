// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    
              width: MediaQuery.of(context).size.width*0.3,
              height:  MediaQuery.of(context).size.height*0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              height:  MediaQuery.of(context).size.height*0.17,
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
                  fontSize: (doctorname.length >= 18) ? 10.sp : 13.sp,
                  color: const Color.fromARGB(255, 111, 104, 104)),
            ),
            Text(speciality,
                style: TextStyle(
                    color: const Color.fromARGB(255, 158, 153, 153),
                    fontSize: (speciality.length >= 17) ? 12 : 15)),
          ],
        ),
      ),
    );
  }
}
