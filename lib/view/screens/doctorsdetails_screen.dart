// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/view/screens/newappointment/newappointmentScreen.dart';
import 'package:flutter/material.dart';
import 'package:doctors_book_app/view/widgets/doctorsdetails/appoinment.dart';
import 'package:doctors_book_app/view/widgets/doctorsdetails/endcontainer.dart';
import 'package:doctors_book_app/view/widgets/doctorsdetails/middlecontainer.dart';

class DoctorsDetailsScreen extends StatelessWidget {
  const DoctorsDetailsScreen({
    Key? key,
    required this.doctorsdatails,
  }) : super(key: key);
  final Map<String, dynamic> doctorsdatails;

  @override
  Widget build(BuildContext context) {
    // print(doctorsdatails);
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.96,
                child: Stack(
                  children: [
                    Positioned(
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                // color: Colorpalette.primarycolor,
                                ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.69,
                            child: Image.network(
                              doctorsdatails['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 20,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 188, 187, 187)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
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
                        ],
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.width * 0.8,
                        child: Endcontainer(
                          doctorsdatails: doctorsdatails,
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.69,
                      left: MediaQuery.of(context).size.width * 0.07,
                      child: Middlecontainer(
                        doctorsdatails: doctorsdatails,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 235, 235, 236),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Working time",
                      style: TextStyle(
                          fontSize: 22, color: Color.fromARGB(255, 64, 63, 63)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(doctorsdatails['time']),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("${doctorsdatails['date']}".toUpperCase()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Bookappointmentbutton(
                          buttontext: "Book appointment",
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NewAppointmentScreenWrapper(
                                        doctorname:
                                            doctorsdatails['doctorname'],
                                        doctordates: doctorsdatails['date'])));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
