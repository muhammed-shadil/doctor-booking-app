// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Cancelbutton extends StatelessWidget {
  const Cancelbutton({
    Key? key,
    required this.buttontext,
    this.onpressed,
  }) : super(key: key);
  final String buttontext;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.34,
      height: MediaQuery.of(context).size.width * 0.1,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 226, 83, 119),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: const Color.fromARGB(255, 245, 231, 236),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cancel_rounded,size: 17,
              color: Color.fromARGB(255, 226, 83, 119),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                buttontext,
                style: const TextStyle(
                    color: Color.fromARGB(255, 226, 83, 119),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
