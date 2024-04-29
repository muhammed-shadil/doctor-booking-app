// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Alerltbutton extends StatelessWidget {
  const Alerltbutton({
    Key? key,
    required this.buttontext,
    this.onpressed,
  }) : super(key: key);
  final String buttontext;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.78,
      height: MediaQuery.of(context).size.width * 0.14,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 240, 14, 71), // Set the button color
            ),
            borderRadius:
                BorderRadius.circular(10), // Adjust the border radius here
          ),
          backgroundColor:
              const Color.fromARGB(255, 238, 219, 225), // Set the button color
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.logout_outlined,color: Color.fromARGB(255, 240, 14, 71),),
            Text(
              buttontext,
              style: const TextStyle(
                  color: Color.fromARGB(255, 234, 28, 80),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
