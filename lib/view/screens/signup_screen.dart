import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/model/model.dart';
import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:doctors_book_app/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupscreenWrapper extends StatelessWidget {
  const SignupscreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Signupscreen(),
    );
  }
}

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final regemail = RegExp(r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}$");

  final phonreg = RegExp(r"^[6789]\d{9}$");

  final paswd =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  final name = RegExp(r'^[A-Za-z]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 241),
      body: Stack(
        children: [
          CustomPaint(
            painter: CurvePainter(),
            child: Container(),
          ),
          Positioned(
            left: 30,
            top: 50,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 151, 151, 150),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    width: 200,
                    height: 160,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset("assets/image-removebg-preview.png",
                        fit: BoxFit.fitHeight),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Welcome to ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Text("MEDICO", style: TextStyle(fontSize: 33)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    // color: Colors.amberAccent,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            MainTextField(
                              controller: emailcontroller,
                              text: "Enter your email ",
                              preficsicon: Icons.email_outlined,
                              helpertext: 'Email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a valid email";
                                } else if (!regemail.hasMatch(value)) {
                                  return "Please enter a valid email";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            MainTextField(
                              controller: namecontroller,
                              text: "Enter your Name ",
                              preficsicon: Icons.person_4,
                              helpertext: 'Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter name";
                                } else if (!name.hasMatch(value)) {
                                  return "Enter a valid name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            MainTextField(
                              controller: phonecontroller,
                              text: "Enter your Phone number ",
                              preficsicon: Icons.lock,
                              helpertext: 'Phone number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter phone number";
                                } else if (value.length > 10) {
                                  return "number must be 10";
                                } else if (!phonreg.hasMatch(value)) {
                                  return "Please enter a valid number";
                                }
                                return null;
                              },
                            ),
                            MainTextField(
                              controller: passwordcontroller,
                              text: "Enter your password ",
                              preficsicon: Icons.lock,
                              helpertext: 'Password',
                              suffixIcon: Icons.remove_red_eye_outlined,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a password";
                                } else if (!paswd.hasMatch(value)) {
                                  return 'Password should contain at least one upper case, one lower case, one digit, one special character and  must be 8 characters in length';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.80,
                              height: MediaQuery.of(context).size.width * 0.14,
                              child: Mainbutton(
                                onpressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Usermodel usermode = Usermodel(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text,
                                        phone: phonecontroller.text,
                                        username: namecontroller.text);

                                    BlocProvider.of<AuthBloc>(context)
                                        .add(SignUpEvent(user: usermode));
                                    // authBlocBlo.add(LoginEvent(
                                    //     email: _emailcontroller.text,
                                    //     password: _passwordcontroller.text));
                                  }
                                },
                                buttontext: "Sign up",
                              ),
                            ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.03,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     const Text("Don't you have an account?",
                            //         style: TextStyle(
                            //             color: Color.fromARGB(255, 134, 128, 128),
                            //             fontSize: 15)),
                            //     TextButton(
                            //       onPressed: () {},
                            //       child: const Text(
                            //         "Sign up",
                            //         style: TextStyle(fontFamily: 'Opensans',fontWeight: FontWeight.w600,
                            //             decoration: TextDecoration.underline,
                            //             color: Color.fromARGB(255, 135, 131, 131),
                            //             fontSize: 15),
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color.fromARGB(98, 169, 219, 230);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.05);
    path.quadraticBezierTo(
        size.width / 2, size.height / 4, size.width, size.height * 0.05);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
