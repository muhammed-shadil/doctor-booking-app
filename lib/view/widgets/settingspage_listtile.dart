// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctors_book_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.content,
    required this.contentIcon,
  }) : super(key: key);

  final String content;
  final IconData contentIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 370,
      child: ListTile(
        trailing: const Icon(Icons.arrow_forward_ios,size: 15,),
        title: Text(content),
        titleTextStyle:  TextStyle(
            fontSize: 18.sp, color: const Color.fromARGB(255, 118, 114, 114)),
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 207, 230, 231),
          radius: 23,
          child: Icon(
            contentIcon,
            size: 24,
            color:  Colorpalette.primarycolor,
          ),
        ),
        // tileColor: Color.fromARGB(255, 205, 204, 200),
      ),
    );
  }
}
