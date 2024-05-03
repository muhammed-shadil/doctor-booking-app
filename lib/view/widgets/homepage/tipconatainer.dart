// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(title
              // "Did you know?",
              ,style:  TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 161, 157, 157),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                left: 14,right: 2
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Color.fromARGB(255, 0, 148, 149), width: 3))),
              child:  Text(describtion
                // "Regular exercise can help lower your risk of heart disease and high blood pressure",
                ,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 150, 149, 149),
                ),
              ))
        ],
      ),
    );
  }
}
