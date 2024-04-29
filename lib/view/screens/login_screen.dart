import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/view/screens/home_screen.dart';
import 'package:doctors_book_app/view/screens/settings_Screen.dart';
import 'package:doctors_book_app/view/screens/signup_screen.dart';
import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:doctors_book_app/view/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginscreenWrapper extends StatelessWidget {
  const LoginscreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final regemail = RegExp(r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}$");
  final paswd =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 241),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          }
          if (state is AuthenticatedError) {
            // LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    "No user Found with this email or password did not match"),
              ),
            );
          } else if (state is AuthLoading) {
            // LoadingDialog.show(context);
            // loadingsheet(context);
          } else if (state is Authenticated) {
            // LoadingDialog.hide(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const settingsScreenWrapper()),
                  (route) => false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("You are Logged in"),
                ),
              );
            });
          }
        },
        child: Stack(
          children: [
            CustomPaint(
              painter: CurvePainter(),
              child: Container(),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
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
                      height: MediaQuery.of(context).size.height * 0.07,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.80,
                                height:
                                    MediaQuery.of(context).size.width * 0.14,
                                child: Mainbutton(
                                  onpressed: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<AuthBloc>(context).add(
                                          LoginEvent(
                                              email: emailcontroller.text,
                                              password:
                                                  passwordcontroller.text));

                                      // authBlocBlo.add(LoginEvent(
                                      //     email: _emailcontroller.text,
                                      //     password: _passwordcontroller.text));
                                    }
                                  },
                                  buttontext: "Sign in",
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't you have an account?",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 134, 128, 128),
                                          fontSize: 15)),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  SignupscreenWrapper()));
                                    },
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(
                                          fontFamily: 'Opensans',
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                          color: Color.fromARGB(
                                              255, 135, 131, 131),
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              )
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
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color.fromARGB(255, 226, 235, 237);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.125);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2.7, size.width, size.height * 0.125);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
