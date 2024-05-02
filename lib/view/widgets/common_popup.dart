import 'package:doctors_book_app/view/widgets/alertconfirmbutton.dart';
import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:flutter/material.dart';

class ConfirmAlert extends StatelessWidget {
  const ConfirmAlert(
      {super.key,
      required this.msg,
      this.iconColor,
      required this.icon,
      required this.onConfirm,
      required this.onReject});

  final String msg;
  final Color? iconColor;

  final IconData icon;
  final VoidCallback onConfirm;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
              side: BorderSide(
                color: Color.fromARGB(255, 234, 28, 80),
              )),
          icon: Icon(
            icon,
            color: iconColor,
            size: 50,
          ),
          backgroundColor: const Color.fromARGB(255, 238, 219, 225),
          title: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Logout!!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 234, 28, 80),
                      fontWeight: FontWeight.w600,
                      fontSize: 29),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    msg,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 116, 116, 115),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Alerlconfirmtbutton(
                    buttontext: "Yes",
                    color: Color.fromARGB(255, 223, 91, 124),
                    onpressed: onConfirm,
                  ),
                ),
                Alerlconfirmtbutton(
                  buttontext: "No",
                  color: const Color.fromARGB(255, 115, 118, 145),
                  onpressed: onReject,
                ),
              ],
            ),
          ),
          // actions: [

          // ],
        ),
      ),
    );
  }
}
