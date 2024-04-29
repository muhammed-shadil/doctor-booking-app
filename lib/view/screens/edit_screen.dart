import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:doctors_book_app/view/widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  TextEditingController phonecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  final phonreg = RegExp(r"^[6789]\d{9}$");
  final name = RegExp(r'^[A-Za-z]+$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 241),
      // appBar: AppBar(leading:Container(margin: EdgeInsets.all(6),
      //         width: 20,
      //         height: 30,
      //         decoration: BoxDecoration(border: Border.all(),
      //             borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 255, 255, 255)),
      //         child: IconButton(
      //           icon: const Icon(
      //             Icons.arrow_back,
      //             color: Color.fromARGB(255, 151, 151, 150),
      //           ),
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //         ),
      //       ),
      //   title: Text("Edit profile"),
      //   centerTitle: true,
      //   titleTextStyle: TextStyle(fontSize: 28,color: Color.fromARGB(255,143,136,136),fontWeight: FontWeight.w500),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 37,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 186, 183, 183)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 22,
                        color: Color.fromARGB(255, 151, 151, 150),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    "Edit profile",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 118, 115, 115)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 134,
                      width: 140,
                      child: Image.asset(
                        'assets/images.jpeg',
                        fit: BoxFit.fill,
                      )),
                  const Positioned(
                    right: -12,
                    top: -15,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromARGB(255, 0, 148, 149),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
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
                  MainTextField(
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
                  MainTextField(
                    controller: namecontroller,
                    text: "Enter your age ",
                    preficsicon: Icons.calendar_month_outlined,
                    helpertext: 'Age',
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
                  MainTextField(
                    controller: phonecontroller,
                    text: "Select Gender ",
                    preficsicon: Icons.male,
                    helpertext: 'Gender',
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
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: Mainbutton(
                        buttontext: "Save",
                        onpressed: () {},
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
