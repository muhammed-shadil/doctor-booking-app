// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class doctorsverticalscroll extends StatelessWidget {
  const doctorsverticalscroll({
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
              padding: EdgeInsets.symmetric(vertical: 4),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/3.jpeg",
                    fit: BoxFit.fill,
                  )
                  //  Image.network(
                  //   userData['image'],
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
            Text("Dr.arshak patel",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color:Color.fromARGB(255, 111, 104, 104) ),),
            Text(firsttext,style: TextStyle(color: Color.fromARGB(255, 158, 153, 153))),
          ],
        ),
      ),
    );
  }
}
