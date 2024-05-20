import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/aboutus/text_and_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackandSupportScreen extends StatelessWidget {
  const FeedbackandSupportScreen({super.key});

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
                    padding: const EdgeInsets.only(left: 23),
                    child: Text("Feedback and Support",
                        style: Textstyles.pagetitlestyle),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child:  Text(
                  "Welcome to the Feedback and Support page of MEDICO. We value your feedback and are here to assist you with any questions or concerns you may have. Here's how you can reach out to us: ",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              const Contents(
                title: "Contact Us",
                content:
                    "If you have any questions, feedback, or suggestions regarding our app, please don't hesitate to contact our support team. You can reach us via email at [support email]. We strive to respond to all inquiries promptly and provide you with the assistance you need.",
              ),
              const Contents(
                title: "Help Center",
                content:
                    "For answers to common questions or troubleshooting tips, please visit our Help Center. Here, you'll find helpful articles and resources to guide you through using our app effectively. Access the Help Center directly from the app's menu or visit our website at [Help Center URL].",
              ),
              const Contents(
                title: "Report an Issue",
                content:
                    "Encountered a problem or bug while using our app? Please let us know by reporting the issue to our support team. You can report issues directly from the app by navigating to the 'Report an Issue' section in the settings menu. Be sure to provide detailed information about the problem you're experiencing so that we can address it promptly.",
              ),
              const Contents(
                  title: "Feedback Form",
                  content:
                      "We value your input and are always looking for ways to improve our app. If you have any feedback or suggestions for us, please fill out our feedback form. Your feedback helps us understand your needs and preferences better, allowing us to make enhancements that benefit all users."),
              const Contents(
                  title: "Stay Connected",
                  content:
                      "Follow us on social media to stay updated on the latest news, updates, and promotions. Connect with us on [social media platforms] to join our community and engage with other users."),
              Container(
                padding: const EdgeInsets.all(14),
                child:  Text(
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    "Thank you for choosing MEDICO. We're committed to providing you with an exceptional experience and are here to support you every step of the way."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
