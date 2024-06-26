// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctors_book_app/view/screens/onbordwidgets/widgets/onbording_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                // color: Colorpalette.primarycolor,
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
          top: MediaQuery.of(context).size.height * 0.53,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 228, 227, 227),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.59,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
          left: MediaQuery.of(context).size.width * 0.07,
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.47,
            child: FadeInDown(
              duration: const Duration(milliseconds: 1400),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: onBoarding.title1,
                        style: TextStyle(
                          fontSize: 29.sp,
                          fontWeight: FontWeight.w300,
                          color: Colorpalette.primarycolor,
                        ),
                        children: [
                          TextSpan(
                            text: onBoarding.title2,
                            style: TextStyle(
                                color: Colorpalette.primarycolor,
                                fontWeight: FontWeight.w500,
                                fontSize: 29.sp),
                          )
                        ]),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    onBoarding.description,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 159, 155, 155),
                    ),
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
