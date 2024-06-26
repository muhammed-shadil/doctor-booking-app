import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/view/screens/categary_screen.dart';
import 'package:doctors_book_app/view/screens/doctors_details/doctors_details_screen.dart';
import 'package:doctors_book_app/view/screens/homepage/widgets/specialist_vertical_scroll.dart';
import 'package:doctors_book_app/view/screens/homepage/widgets/speciality_list.dart';
import 'package:doctors_book_app/view/screens/homepage/widgets/tip_conatainer.dart';
import 'package:doctors_book_app/view/screens/homepage/widgets/top_doctors_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "SPECIALIST",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 121, 118, 118),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              height: 140,
              //  MediaQuery.of(context).size.height * 0.18,
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
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 12),
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
                                      secondtext: specialis
                                          .specialistdata[index].secondtext,
                                      thirdtext:
                                          "${snapshot.data!.docs.length} doctors",
                                      icon: specialis
                                          .specialistdata[index].icon1),
                                ));
                          }
                          return Container();
                        });
                  })),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 15),
            child: Text(
              "GET CARE",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 163, 153, 153),
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
                    "Create a relaxing bedtime routine to signal to your body that it's time to wind down.",
              ),
              Autoscrollcontainer(
                title: 'Stress tip',
                describtion:
                    'Practice deep breathing exercises or meditation for a few minutes each day to help calm your mind .',
              ),
              Autoscrollcontainer(
                title: 'Did you know?',
                describtion:
                    'Weight-bearing exercises like walking, jogging, and dancing can help strengthen your bones .',
              ),
              Autoscrollcontainer(
                title: 'Skincare Tip:',
                describtion:
                    "Protect your skin from the sun harmful UV rays by wearing sunscreen with at SPF 30 every day.",
              ),
            ],
            options: CarouselOptions(
              height: 135.0,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              // viewportFraction: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 15),
            child: Text(
              "TOP DOCTORS",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 163, 153, 153),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("doctors")
                      .orderBy('nopatients', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
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
