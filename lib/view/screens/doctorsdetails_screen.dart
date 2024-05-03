import 'package:doctors_book_app/view/widgets/doctorsdetails/endcontainer.dart';
import 'package:doctors_book_app/view/widgets/doctorsdetails/middlecontainer.dart';
import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorsDetailsScreen extends StatelessWidget {
  const DoctorsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        decoration: const BoxDecoration(
                            // color: Color.fromARGB(255, 0, 148, 149),
                            ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.69,
                        child: Image.asset(
                          "assets/7.jpeg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.width * 0.8,
                        child: const Endcontainer()),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.69,
                      left: MediaQuery.of(context).size.width * 0.07,
                      child: const Middlecontainer(),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 235, 235, 236),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Working time",
                      style: TextStyle(
                          fontSize: 22, color: Color.fromARGB(255, 64, 63, 63)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Monday-Friday 09:00 Am - 12:00 Pm"),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 235, 235, 236),
                child: Mainbutton(
                  buttontext: "Book appointment",
                  onpressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
