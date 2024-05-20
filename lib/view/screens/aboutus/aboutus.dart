import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/aboutus/text_and_details.dart';
import 'package:doctors_book_app/view/screens/aboutus/unorderedlist.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("ABOUT US", style: Textstyles.pagetitlestyle),
                  )
                ],
              ),
              const Contents(
                title: "About MEDICO",
                content:
                    "Welcome to our doctor booking app! We're thrilled to have you here and to introduce you to our platform designed to simplify your healthcare experience. Here's what you need to know about us:",
              ),
              const Contents(
                title: "Our Mission",
                content:
                    "At MEDICO, our mission is simple: to connect patients with the healthcare they need, when they need it. We believe that accessing healthcare should be convenient, transparent, and empowering for everyone. With our app, you can book appointments with ease, giving you more control over your healthcare journey.",
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Team",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colorpalette.primarycolor,
                          fontWeight: FontWeight.w600),
                    ),
                    BulletList([
                      'Effortless Appointment Booking: Say goodbye to long phone calls and waiting times. With our app, you can book appointments with a wide range of healthcare providers in just a few taps.',
                      'Comprehensive Doctor Directory: Our platform features a diverse network of doctors spanning various specialties and locations, ensuring that you can find the right healthcare professional for your needs.',
                      "Appointment Reminders: Never miss an appointment again! We'll send you timely reminders so you can stay on top of your healthcare schedule.",
                      "User-Friendly Interface: Our app is designed to be intuitive and user-friendly, making it easy for anyone to navigate and use. Whether you're tech-savvy or not, you'll find our app simple and straightforward to use."
                    ])
                  ],
                ),
              ),
              const Contents(
                title: "Our Team",
                content:
                    "Behind MEDICO is a passionate team of healthcare professionals, designers, and developers dedicated to improving the healthcare experience for all. We're committed to leveraging technology to make healthcare more accessible and convenient for everyone.",
              ),
              const Contents(
                title: "Get in Touch",
                content:
                    "Have questions or feedback? We'd love to hear from you! Feel free to reach out to our support team at [support email] or connect with us on social media. Your input helps us continue to improve and enhance our app for all users.Thank you for choosing MEDICO for your healthcare needs. We're honored to be part of your healthcare journey and look forward to serving you!",
              )
            ],
          ),
        ),
      ),
    );
  }
}
