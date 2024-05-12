// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class patientRow extends StatelessWidget {
  const patientRow({
    Key? key,
    required this.firstname,
    required this.secondname,
  }) : super(key: key);
  final String firstname;
  final String secondname;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Text(
            firstname,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 156, 153, 153)),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            secondname,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 92, 89, 89)),
          ),
        ],
      ),
    );
  }
}
