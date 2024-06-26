import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/model/user_model.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/login_screen/login_screen.dart';
import 'package:doctors_book_app/view/screens/signup_screen/widgets/custompaint_signup.dart';
import 'package:doctors_book_app/view/widgets/loading.dart';
import 'package:doctors_book_app/view/widgets/main_button.dart';
import 'package:doctors_book_app/view/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: Colorpalette.secondarycolor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedError) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is AuthLoading) {
            LoadingDialog.show(context);
          } else if (state is Networkauthenticatederor) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("No  intrnet connection !!!"),
              ),
            );
          } else if (state is Authenticated) {
            LoadingDialog.hide(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginscreenWrapper()),
                  (route) => false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sign up successfully"),
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
            Positioned(
              left: 30,
              top: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 188, 187, 187)),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colorpalette.backarrowcolor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
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
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset("assets/image-removebg-preview.png",
                          fit: BoxFit.fitHeight),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Welcome to ",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ),
                    Text("MEDICO", style: TextStyle(fontSize: 33.sp)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              MainTextField(
                                keyboard: TextInputType.emailAddress,
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
                                keyboard: TextInputType.phone,
                                controller: phonecontroller,
                                text: "Enter your Phone number ",
                                preficsicon: Icons.phone_android,
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
                                keyboard: TextInputType.visiblePassword,
                                controller: passwordcontroller,
                                text: "Enter your password ",
                                preficsicon: Icons.lock,
                                helpertext: 'Password',
                                obscuretext: true,
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
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.80,
                                height:
                                    MediaQuery.of(context).size.width * 0.14,
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
                                    }
                                  },
                                  buttontext: "Sign up",
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
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
