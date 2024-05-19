import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/FAQS/contents.dart';
import 'package:doctors_book_app/view/screens/aboutus/text_and_details.dart';
import 'package:doctors_book_app/view/screens/aboutus/unorderedlist.dart';
import 'package:flutter/material.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 37,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 186, 183, 183)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 22,
                          color: Color.fromARGB(255, 151, 151, 150),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 70),
                    child: Text(
                      "FAQs",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 118, 115, 115)),
                    ),
                  )
                ],
              ),
              const FAQContents(
                title: "General Questions",
                content:
                    " MEDICO is a doctor booking app that allows you to easily schedule appointments with healthcare providers, manage your appointments, and access healthcare services conveniently from your mobile device.",
                question: "What is MEDICO ?",
                question2: '.Is MEDICO free to use? ',
                content2:
                    'Yes, MEDICO is free to download and use. You only pay for the services provided by the healthcare providers you book appointments with.',
              ),
              const FAQContents(
                  title: "Getting Started",
                  content:
                      "To book an appointment, simply search for a healthcare provider or specialty, select an available appointment slot, and confirm your booking. You'll receive a confirmation email or notification once your appointment is scheduled.",
                  question: "How do I book an appointment?",
                  question2: "Can I book appointments for family members? ",
                  content2:
                      "Yes, you can book appointments for family members by adding them to your account as dependents. This allows you to manage appointments for your loved ones from a single account."),
              const FAQContents(
                  title: "Account Management",
                  content:
                      " You can update your profile information, including your name, email address, and phone number, by accessing the 'Profile' section in the app's settings menu.",
                  question: "How do I update my profile information?",
                  question2: "What do I do if I forget my password? ",
                  content2:
                      "If you forget your password, you can reset it by tapping the 'Forgot Password' link on the login screen. Follow the instructions to reset your password and regain access to your account."),
              const FAQContents(
                  title: "Privacy and Security",
                  content:
                      "Yes, we take the privacy and security of your personal information seriously. We employ industry-standard security measures to safeguard your data and ensure it is protected against unauthorized access or disclosure.",
                  question: "Is my personal information secure?",
                  question2: "Do you share my information with third parties? ",
                  content2:
                      "We do not share your personal information with third parties without your consent, except as required by law or as necessary to provide the services you request."),
              const FAQContents(
                  title: "Technical Support",
                  content:
                      "If you encounter technical issues while using the app, please report them to our support team by tapping the 'Report an Issue' button in the settings menu. Provide as much detail as possible about the issue, including any error messages you receive.",
                  question:
                      "I'm experiencing technical issues with the app. What should I do? ",
                  question2:
                      ".Which devices and operating systems are supported?",
                  content2:
                      "MEDICO is compatible with both iOS and Android devices. Make sure you have the latest version of the app installed for the best experience.")
            ],
          ),
        ),
      ),
    );
  }
}
