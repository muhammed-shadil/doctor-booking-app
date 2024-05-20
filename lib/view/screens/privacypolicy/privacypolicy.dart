import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/aboutus/text_and_details.dart';
import 'package:doctors_book_app/view/screens/aboutus/unorderedlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacypolicyScreen extends StatelessWidget {
  const PrivacypolicyScreen({super.key});

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
                    child: Text("Privacy Policy",
                        style: Textstyles.pagetitlestyle),
                  )
                ],
              ),
              const Contents(
                  title: "Last Updated: 20-05-2024",
                  content:
                      "MEDICO  is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our doctor booking app, MEDICO. Please read this Privacy Policy carefully. By using our app, you consent to the collection, use, disclosure, and safeguarding of your information in accordance with this Privacy Policy."),
              const Contents(
                title: "Data Security",
                content:
                    "We implement reasonable measures to safeguard your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure.",
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Information We Collect",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colorpalette.primarycolor,
                          fontWeight: FontWeight.w600),
                    ),
                    const BulletList([
                      'Personal Information: When you register an account, we may collect personal information such as your name, email address, phone number, and date of birth.',
                      "Booking Information: We collect information about the appointments you book through our app, including the doctor's name, appointment date and time, and any notes or preferences you provide.",
                      "Usage Data: We may collect information about how you interact with our app, including the features you use and the actions you take.",
                    ])
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How We Use Your Information",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colorpalette.primarycolor,
                          fontWeight: FontWeight.w600),
                    ),
                    const BulletList([
                      'To Provide Services: We use your information to facilitate appointment bookings, send appointment reminders, and provide customer support.',
                      'To Improve Our App: We may use your information to analyze app usage trends, identify areas for improvement, and enhance the user experience.',
                      "For Marketing Purposes: With your consent, we may send you promotional communications about our app and related products or services.",
                    ])
                  ],
                ),
              ),
              const Contents(
                title: "Your Choices",
                content:
                    "You can update or delete your account information at any time by accessing your account settings in the app. You may also opt out of receiving promotional communications from us by following the instructions provided in the communication.",
              ),
              const Contents(
                title: "Children's Privacy",
                content:
                    "Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13.",
              ),
              const Contents(
                  title: "Changes to This Privacy Policy",
                  content:
                      "We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page."),
              const Contents(
                  title: "Contact Us",
                  content:
                      "If you have any questions or concerns about this Privacy Policy, please contact us at muhammedshadil220@gmail.com .")
            ],
          ),
        ),
      ),
    );
  }
}
