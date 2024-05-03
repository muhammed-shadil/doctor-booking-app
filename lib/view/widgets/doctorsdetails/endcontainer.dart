import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Endcontainer extends StatelessWidget {
  const Endcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 235, 235, 236),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr .Jane Cooper",
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 64, 63, 63)),
                ),
                Text(
                  "MBBS,MD ,FACS",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 92, 91, 91)),
                ),
                Text(
                  "cardeology",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 92, 91, 91)),
                )
              ],
            ),
          ),
          const SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About doctor",
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 64, 63, 63)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Dr. Jane Cooper is a board-certified cardiologist with extensive experience in treating cardiovascular conditions. She specializes in interventional cardiology and electrophysiology. With a dedication to advancing cardiac care through research and compassionate patient-centered approach, Dr. Smith is committed to improving the heart health of her patients.",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 158, 156, 156)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
