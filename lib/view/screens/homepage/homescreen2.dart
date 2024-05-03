import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctors_book_app/view/widgets/homepage/specialistverticalscroll.dart';
import 'package:doctors_book_app/view/widgets/homepage/tipconatainer.dart';
import 'package:doctors_book_app/view/widgets/homepage/topdoctorsscroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSpecialist extends StatelessWidget {
  const HomeSpecialist({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 12),
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
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    // final category = snapshot.data?.docs[index].data();
                    // if (category != null) {
                    return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Specialistverticalscroll(
                            firsttext: "cardeo",
                            secondtext: "Specialist",
                            thirdtext: "12 doctors",
                            icon: Icons.wheelchair_pickup));
                  })),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
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
            padding: EdgeInsets.symmetric(horizontal: 12),
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
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    // final category = snapshot.data?.docs[index].data();
                    // if (category != null) {
                    return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: doctorsverticalscroll(
                            firsttext: "cardeo",
                            secondtext: "Specialist",
                            thirdtext: "12 doctors",
                            icon: Icons.wheelchair_pickup));
                  })),
          const SizedBox(
            height: 45,
          )
        ],
      ),
    );
  }
}
