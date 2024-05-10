import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/view/screens/categaryScreen.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:doctors_book_app/view/widgets/homepage/specialistverticalscroll.dart';
import 'package:doctors_book_app/view/widgets/homepage/specialitylist.dart';
import 'package:doctors_book_app/view/widgets/homepage/tipconatainer.dart';
import 'package:doctors_book_app/view/widgets/homepage/topdoctorsscroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSpecialist extends StatelessWidget {
  HomeSpecialist({super.key});

  specialist specialis = specialist();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "SPECIALIST",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 121, 118, 118),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: specialis.specialistdata.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("doctors")
                            .where(
                              "speciality",
                              isEqualTo:
                                  specialis.specialistdata[index].firsttext,
                            )
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CategoryScreen(
                                                  title: specialis
                                                      .specialistdata[index]
                                                      .firsttext,
                                                )));
                                  },
                                  child: Specialistverticalscroll(
                                      firsttext: specialis
                                          .specialistdata[index].firsttext,
                                      // doctorspecial['speciality'],
                                      secondtext:
                                          // specialis.specialistdata[index].firsttext.length >=
                                          //         20
                                          //     ? ""
                                          //     :
                                          specialis
                                              .specialistdata[index].secondtext,
                                      thirdtext:
                                          //  "0 doctors"
                                          "${snapshot.data!.docs.length} doctors",
                                      icon: specialis
                                          .specialistdata[index].icon1),
                                ));
                          }
                          return Container();
                        });
                  })),
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 15),
            child: Text(
              "GET CARE",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 163, 153, 153),
                  fontWeight: FontWeight.w500),
            ),
          ),
          CarouselSlider(
            items: const [
              Autoscrollcontainer(
                title: "Did you know?",
                describtion:
                    "Regular exercise can help lower your risk of heart disease and high blood pressure",
              ),
              Autoscrollcontainer(
                title: 'Sleep tip',
                describtion:
                    " Create a relaxing bedtime routine to signal to your body that it's time to wind down.",
              ),
              Autoscrollcontainer(
                title: 'Stress tip',
                describtion:
                    ' Practice deep breathing exercises or meditation for a few minutes each day to help calm your mind .',
              ),
              Autoscrollcontainer(
                title: 'Did you know?',
                describtion:
                    ' Weight-bearing exercises like walking, jogging, and dancing can help strengthen your bones .',
              ),
              Autoscrollcontainer(
                title: 'Skincare Tip:',
                describtion:
                    " Protect your skin from the sun's harmful UV rays by wearing sunscreen with at least SPF 30 every day.",
              ),
            ],
            options: CarouselOptions(
              height: 130.0,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              // viewportFraction: 0.8,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 15),
            child: Text(
              "TOP DOCTORS",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 163, 153, 153),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              height: 180,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("doctors")
                      .orderBy('nopatients', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final doctorsdata =
                                snapshot.data!.docs[index].data();
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                DoctorsDetailsScreen(
                                                  doctorsdatails: doctorsdata,
                                                )));
                                  },
                                  child: doctorsverticalscroll(
                                      image: doctorsdata["image"],
                                      speciality: doctorsdata['speciality'],
                                      doctorname: doctorsdata['doctorname']),
                                ));
                          });
                    }
                    return Container();
                  })),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
