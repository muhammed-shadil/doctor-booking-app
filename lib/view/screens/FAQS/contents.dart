import 'package:doctors_book_app/utility/constants.dart';
import 'package:flutter/material.dart';

class FAQContents extends StatelessWidget {
  const FAQContents(
      {super.key,
      required this.title,
      required this.content,
      required this.question,
      required this.question2,
      required this.content2});
  final String title;
  final String content;
  final String question;
  final String question2;
  final String content2;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1.$question",
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
                Text(
                  content,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "2.$question2",
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
                Text(
                  content2,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
