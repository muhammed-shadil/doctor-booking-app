// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    Key? key,
    required this.controller,
    required this.text,
    required this.preficsicon,
    required this.helpertext,
    this.suffixIcon,
    this.keyboard,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final IconData preficsicon;
  final String helpertext;
  final IconData? suffixIcon;
  final TextInputType? keyboard;
  final String? Function(dynamic value) validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              preficsicon,
              color: const Color.fromARGB(255, 0, 148, 149),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(helpertext,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 134, 128, 128), fontSize: 17)),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: TextFormField(
            validator: validator,
            keyboardType: keyboard,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(
              color: Color.fromARGB(255, 68, 73, 53),
              fontSize: 16,
            ),
            controller: controller,
            decoration: InputDecoration(
                errorMaxLines: 3,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 68, 73, 53),
                    width: 0.25,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(68, 73, 53, 1),
                    width: 0.55,
                  ),
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(68, 73, 53, 1),
                    width: 0.55,
                  ),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 68, 73, 53),
                    width: 0.55,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 68, 73, 53),
                    width: 1.5,
                  ),
                ),
                hintStyle: const TextStyle(
                    fontFamily: 'Opensans',
                    color: Color.fromARGB(255, 171, 168, 168),
                    fontWeight: FontWeight.w200),
                hintText: text,
                suffixIcon: Icon(
                  suffixIcon,
                  color: const Color.fromARGB(255, 0, 148, 149),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 7)),
          ),
        ),
      ],
    );
  }
}
