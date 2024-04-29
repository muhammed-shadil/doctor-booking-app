// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:doctors_book_app/view/widgets/onbordwidgets/onbordingdata.dart';

class OnbordingMainWidget extends StatelessWidget {
  final Onboarding onBoarding;
  final int index;
  const OnbordingMainWidget({
    Key? key,
    required this.onBoarding,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 0, 148, 149),
                ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.58,
            child: Image.asset(
              onBoarding.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width * 0.96,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(255, 228, 227, 227),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.59,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width * 0.79,
          left: MediaQuery.of(context).size.width * 0.07,
          child: Container(padding: EdgeInsets.only(top: 30,left: 24,right: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.5,
            child: FadeInDown(
              duration: const Duration(milliseconds: 1400),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: onBoarding.title1,
                        style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 0, 148, 149),),
                        children: [
                          TextSpan(
                            text: onBoarding.title2,
                            style: const TextStyle(color:  Color.fromARGB(255, 0, 148, 149),
                                fontWeight: FontWeight.w500, fontSize: 29),
                          )
                        ]),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    onBoarding.description,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color:  Color.fromARGB(255, 159, 155, 155),),
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}