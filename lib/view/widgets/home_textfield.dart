// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/view/screens/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeTextfield1 extends StatelessWidget {
  const HomeTextfield1({
    Key? key,
    this.keyboard,
    this.icon1,
    this.hint,
    this.controller,
    required this.validator,
  }) : super(key: key);
  final TextInputType? keyboard;
  final Icon? icon1;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(dynamic value) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const SearchScreenWrapper()));
      },
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      keyboardType: keyboard,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        errorMaxLines: 3,
        hintText: hint,
        hintStyle: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 18),
        suffixIcon: icon1,
        suffixIconColor: Colors.black54,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
              // color: Color.fromARGB(255, 227, 8, 12),
              ),
        ),

        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(10),
        //   ),
        //   borderSide: BorderSide(
        //     color: Color.fromARGB(255, 93, 201, 173),
        //   ),
        // ),
      ),
    );
  }
}
