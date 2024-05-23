import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Colorpalette {
  static const Color primarycolor = Color.fromARGB(255, 0, 148, 149);
  static const Color secondarycolor = Color.fromARGB(255, 240, 240, 241);
  static const Color backarrowcolor = Color.fromARGB(255, 151, 151, 150);
  static const Color primarybordercolor = Color.fromARGB(255, 186, 183, 183);
}

class Textstyles {
  static TextStyle pagetitlestyle = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromARGB(255, 118, 115, 115));
}
class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colorpalette.primarycolor, size: 50,
     
    );
  }
}