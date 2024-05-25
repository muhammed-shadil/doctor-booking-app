import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/model/usermodel.dart';
import 'package:doctors_book_app/view/screens/editscreen/edit_screen.dart';
import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:doctors_book_app/view/widgets/textfield.dart';
import 'package:flutter/material.dart';

class Userform extends StatelessWidget {
  const Userform({
    super.key,
    required this.namecontroller,
    required this.name,
    required this.phonecontroller,
    required this.phonreg,
    required this.agecontroller,
    required this.age,
    required this.addresscontroller,
    required this.addressRegex,
    required this.formKey,
    required this.userData,
    required this.widget,
    required this.authblo,
  });

  final TextEditingController namecontroller;
  final RegExp name;
  final TextEditingController phonecontroller;
  final RegExp phonreg;
  final TextEditingController agecontroller;
  final RegExp age;
  final TextEditingController addresscontroller;
  final RegExp addressRegex;
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic>? userData;
  final EditProfileScreen widget;
  final AuthBloc authblo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          MainTextField(
            controller: namecontroller,
            text: "Enter your Name ",
            preficsicon: Icons.person_4,
            helpertext: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter name";
              } else if (!name.hasMatch(value)) {
                return "Enter a valid name";
              } else {
                return null;
              }
            },
          ),
          MainTextField(keyboard: TextInputType.phone,
            controller: phonecontroller,
            text: "Enter your Phone number ",
            preficsicon: Icons.lock,
            helpertext: 'Phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter phone number";
              } else if (value.length > 10) {
                return "number must be 10";
              } else if (!phonreg.hasMatch(value)) {
                return "Please enter a valid number";
              }
              return null;
            },
          ),
          MainTextField(keyboard: TextInputType.number,
            controller: agecontroller,
            text: "Enter your age ",
            preficsicon: Icons.calendar_month_outlined,
            helpertext: 'Age',
            validator: (value) => (value == null || value.isEmpty)
                ? "Please enter the age"
                : (!age.hasMatch(value))
                    ? "Please enter a valid age"
                    : null,
          ),
          MainTextField(keyboard: TextInputType.streetAddress,
            controller: addresscontroller,
            text: "Enter your address ",
            preficsicon: Icons.location_on_outlined,
            helpertext: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter address";
              } else if (!addressRegex.hasMatch(value)) {
                return "Enter a valid address";
              } else {
                return null;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.width * 0.14,
                child: Mainbutton(
                  buttontext: "Save",
                  onpressed: () {
                    if (formKey.currentState!.validate()) {
                      if (userData!['image']==null) {
                       ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("please wait,the image is loading"),
                        ),
                      );
                      }
                      else{
                      Usermodel user1 = Usermodel(
                          image: userData!['image'],
                          uid: widget.userDatas['uid'],
                          username: namecontroller.text,
                          age: agecontroller.text,
                          email: widget.userDatas['email'],
                          phone: phonecontroller.text,
                          address: addresscontroller.text);
                      authblo.add(UpdateEvent(user: user1));
                    }}
                  },
                )),
          )
        ],
      ),
    );
  }
}
