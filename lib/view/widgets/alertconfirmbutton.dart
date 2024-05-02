// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Alerlconfirmtbutton extends StatelessWidget {
  const Alerlconfirmtbutton({
    Key? key,
    required this.buttontext,
    this.onpressed,
    required this.color,
  }) : super(key: key);
  final String buttontext;
  final Function()? onpressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.width * 0.10,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
           
            borderRadius:
                BorderRadius.circular(10), // Adjust the border radius here
          ),
          backgroundColor:
             color, // Set the button color
        ),
        child: Text(
          buttontext,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
    ;
  }
}
