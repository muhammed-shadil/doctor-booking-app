// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctors_book_app/controller/newappointment/bloc/newappointment_bloc.dart';

class Dropdownfield extends StatelessWidget {
  Dropdownfield({
    Key? key,
    required this.preficsicon,
    required this.helpertext,
    required this.validator,
  }) : super(key: key);
  final IconData preficsicon;
  final String helpertext;

  final String? Function(dynamic value) validator;
  final List<String> genderItems = ['Male', 'Female', 'other'];
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          ),
        ],
      ),
      BlocProvider(
        create: (context) => NewappointmentBloc(),
        child: DropdownButtonFormField2<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          isExpanded: true,
          decoration: const InputDecoration(
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 68, 73, 53),
              ),
            ),
            // Add more decoration..
          ),
          hint: const Text(
            'Select Your Gender',
            style: TextStyle(
                color: Color.fromARGB(255, 171, 168, 168),
                fontWeight: FontWeight.w400),
          ),
          items: genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 86, 86, 86)),
                    ),
                  ))
              .toList(),
          validator: validator,
          onChanged: (value) {
            print(value);
            BlocProvider.of<NewappointmentBloc>(context)
                .add(DropdowngenderEvent(selectgender: value.toString()));
            //Do something when selected item is changed.
          },
          // onSaved: (value) {
          //   selectedValue = value.toString();
          // },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 240, 241),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
      const SizedBox(
        height: 23,
      )
    ]);
  }
}