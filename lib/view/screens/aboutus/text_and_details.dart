import 'package:doctors_book_app/utility/constants.dart';
import 'package:flutter/material.dart';

class Contents extends StatelessWidget {
  const Contents({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                color: Colorpalette.primarycolor,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
