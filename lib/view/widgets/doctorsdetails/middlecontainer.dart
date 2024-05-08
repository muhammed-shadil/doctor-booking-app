// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Middlecontainer extends StatelessWidget {
  const Middlecontainer({
    Key? key,
    required this.doctorsdatails,
  }) : super(key: key);

  final Map<String, dynamic> doctorsdatails;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 237, 235, 235),
            child: Icon(
              Icons.people_alt,
              color: Color.fromARGB(255, 0, 148, 149),
              size: 25,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorsdatails['nopatients'],
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 92, 91, 91)),
              ),
              const Text("Patients",
                  style: TextStyle(color: Color.fromARGB(255, 148, 146, 146)))
            ],
          ),
          const VerticalDivider(),
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 237, 235, 235),
            child: Icon(
              Icons.badge,
              color: Color.fromARGB(255, 0, 148, 149),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(doctorsdatails['experince'],
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 92, 91, 91))),
              const Text("Experiences",
                  style: TextStyle(color: Color.fromARGB(255, 148, 146, 146)))
            ],
          ),
        ],
      ),
    );
  }
}
