// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/image/bloc/image_bloc.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/edit_screen/widgets/userform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';

class EditScreenWrapper extends StatelessWidget {
  const EditScreenWrapper({
    Key? key,
    required this.userDatas,
  }) : super(key: key);
  final Map<String, dynamic> userDatas;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ImageBloc(),
        ),
      ],
      child: EditProfileScreen(
        userDatas: userDatas,
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
    required this.userDatas,
  }) : super(key: key);
  final Map<String, dynamic> userDatas;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phonecontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController agecontroller = TextEditingController();

  TextEditingController addresscontroller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final phonreg = RegExp(r"^[6789]\d{9}$");
  final addressRegex = RegExp(r"^[A-Za-z0-9'\-\,\s\,]{3,}$");

  final age = RegExp(r'^(1[0-9]|[2-9][0-9]|100)$');
  final name = RegExp(r'^[A-Za-z]+$');
  @override
  void initState() {
    namecontroller.text = widget.userDatas['username'];
    phonecontroller.text = widget.userDatas['phone'];
    agecontroller.text = widget.userDatas['age'] ?? "";
    addresscontroller.text = widget.userDatas['address'] ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authblo = BlocProvider.of<AuthBloc>(context);
    final imageblo = BlocProvider.of<ImageBloc>(context);
    return Scaffold(
        backgroundColor: Colorpalette.secondarycolor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: MultiBlocListener(
              listeners: [
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is UpdateState) {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Details updated successfully"),
                        ),
                      );
                    } else if (state is UpdationError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error!!! ${state.msg}"),
                        ),
                      );
                    }
                  },
                ),
                BlocListener<ImageBloc, ImageState>(
                  listener: (context, state) {
                    if (state is uploadimagesucces) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Image is uploaded"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else if (state is Uploadimagefailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error!!! ${state.msg}"),
                          backgroundColor: Colors.red[300],
                        ),
                      );
                    }
                  },
                ),
              ],
              child:
                  BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(user.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child:
                              //  CircularProgressIndicator()
                              SizedBox(
                                  width: 70,
                                  height: MediaQuery.of(context).size.height,
                                  child: const CustomLoadingAnimation()),
                        );
                      }
                      if (snapshot.hasData) {
                        final userData =
                            snapshot.data?.data() as Map<String, dynamic>?;
                        if (userData != null) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    width: 37,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 186, 183, 183)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_back,
                                            size: 22,
                                            color: Colorpalette.backarrowcolor),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Text("Edit profile",
                                        style: Textstyles.pagetitlestyle),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Center(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // return
                                    Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 194, 192, 192)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        height: 120,
                                        width: 120,
                                        child: (userData['image'] == null)
                                            ? (state is Uploadimageloading)
                                                ? const Center(
                                                    child:
                                                        // CircularProgressIndicator(),
                                                        CustomLoadingAnimation(),
                                                  )
                                                : const Icon(
                                                    Icons.person_4_outlined,
                                                    size: 45,
                                                  )
                                            : (state is Uploadimageloading)
                                                ? const Center(
                                                    child:
                                                        // CircularProgressIndicator()
                                                        CustomLoadingAnimation(),
                                                  )
                                                : Image.network(
                                                    userData['image'],
                                                    fit: BoxFit.cover,
                                                  )),

                                    Positioned(
                                      right: -12,
                                      top: -15,
                                      child: CircleAvatar(
                                        radius: 22,
                                        backgroundColor: const Color.fromARGB(
                                            255, 0, 148, 149),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 22,
                                          ),
                                          onPressed: () {
                                            imageblo.add(Selectimage(
                                                email:
                                                    widget.userDatas['email']));
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Userform(
                                  namecontroller: namecontroller,
                                  name: name,
                                  phonecontroller: phonecontroller,
                                  phonreg: phonreg,
                                  agecontroller: agecontroller,
                                  age: age,
                                  addresscontroller: addresscontroller,
                                  addressRegex: addressRegex,
                                  formKey: formKey,
                                  userData: userData,
                                  widget: widget,
                                  authblo: authblo)
                            ],
                          );
                        }
                      }
                      return Container();
                    });
              }),
            ),
          ),
        )));
  }
}
