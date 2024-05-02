// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
      height: 70,
      width: 370,
      child: ListTile(
        trailing: const Icon(Icons.arrow_forward_ios,size: 15,),
        title: Text(content),
        titleTextStyle: const TextStyle(
            fontSize: 18, color: Color.fromARGB(255, 118, 114, 114)),
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 207, 230, 231),
          radius: 25,
          child: Icon(
            contentIcon,
            size: 28,
            color: Color.fromARGB(255, 0, 148, 149),
          ),
        ),
        // tileColor: Color.fromARGB(255, 205, 204, 200),
      ),
    );
  }
}
