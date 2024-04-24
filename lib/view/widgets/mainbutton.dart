// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

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
      onPressed:onpressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10), // Adjust the border radius here
        ),
        backgroundColor: const Color.fromARGB(
            255, 0, 148, 149), // Set the button color
      ),
      child:  Text(
       buttontext,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
