// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telephony/telephony.dart';
import 'package:uuid/uuid.dart';
import 'package:doctors_book_app/controller/commen_fucntions.dart';
import 'package:doctors_book_app/controller/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:doctors_book_app/model/patients_model.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/new_appointment/widgets/dropdown_field.dart';
import 'package:doctors_book_app/view/widgets/loading.dart';
import 'package:doctors_book_app/view/widgets/main_button.dart';
import 'package:doctors_book_app/view/widgets/textfield.dart';

class NewAppointmentScreenWrapper extends StatelessWidget {
  const NewAppointmentScreenWrapper({
    Key? key,
    required this.doctorname,
    required this.doctordates,
  }) : super(key: key);
  final String doctorname;
  final String doctordates;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewappointmentBloc(),
      child: NewAppointmentScreen(
          doctorname: doctorname, doctordates: doctordates),
    );
  }
}

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({
    Key? key,
    required this.doctorname,
    required this.doctordates,
  }) : super(key: key);
  final String doctorname;
  final String doctordates;
  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  int? currentindex = 0;
  String? selecttime;
  DateTime? date;
  String uuid = const Uuid().v4();
  String? gender;
  final user = FirebaseAuth.instance.currentUser;
  final Telephony telephony = Telephony.instance;
  TextEditingController patientcontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  Functions functions = Functions();
  final regemail = RegExp(r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}$");
  final age = RegExp(r'^(1[0-9]|[2-9][0-9]|100)$');
  final phonreg = RegExp(r"^[6789]\d{9}$");
  final name = RegExp(r'^[A-Za-z]+$');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<dynamic> bookedTimeSlots = [];
  List<int> availableDays = [];
  void fetchBookedTimeSlots(DateTime selectedDate, String doctorname) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("patients")
        .where('date', isEqualTo: selectedDate)
        .where('doctorname', isEqualTo: doctorname)
        .get()
        .then((querySnapshot) {
      setState(() {
        bookedTimeSlots = querySnapshot.docs.map((doc) => doc['time']).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDoctorAvailability();
  }

  void fetchDoctorAvailability() {
    String doctorAvailability = widget.doctordates;
    setState(() {
      availableDays = parseAvailability(doctorAvailability);
    });
  }

  List<DateTime> _getDisabledDates() {
    List<DateTime> disabledDates = [];
    DateTime currentDate = DateTime.now();
    DateTime endDate = currentDate.add(const Duration(days: 365));
    for (DateTime date = currentDate.subtract(const Duration(days: 365));
        date.isBefore(currentDate);
        date = date.add(const Duration(days: 1))) {
      disabledDates.add(date);
    }
    for (DateTime date = currentDate;
        date.isBefore(endDate);
        date = date.add(const Duration(days: 1))) {
      if (!availableDays.contains(date.weekday)) {
        disabledDates.add(date);
      }
    }
    return disabledDates;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewappointmentBloc, NewappointmentState>(
      listener: (context, state) {
        if (state is timepickedState) {
          selecttime = state.times;
          currentindex = state.index;
        } else if (state is datepickedState) {
          date = state.dates;
          fetchBookedTimeSlots(state.dates, widget.doctorname);
        } else if (state is NewpatientSuccessState) {
          LoadingDialog.hide(context);
          functions.confirmdialoage(context, state.patientdetails);
        } else if (state is NewpatientloadingState) {
          LoadingDialog.show(context);
        } else if (state is NewpatientErrorState) {
          LoadingDialog.hide(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
            ),
          );
        } else if (state is DropdowngenderState) {
          gender = state.gender;
        }
      },
      child: Scaffold(
        backgroundColor: Colorpalette.secondarycolor,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            width: 37,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colorpalette.primarybordercolor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 22,
                                  color: Colorpalette.backarrowcolor,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("New Appointment",
                                style: Textstyles.pagetitlestyle),
                          )
                        ],
                      ),
                      EasyDateTimeLine(
                        headerProps: const EasyHeaderProps(
                          dateFormatter: DateFormatter.custom("d EE,y"),
                        ),
                        disabledDates: _getDisabledDates(),
                        initialDate: DateTime.now(),
                        onDateChange: (selectedDate) {
                          BlocProvider.of<NewappointmentBloc>(context)
                              .add(datepickEvent(date: selectedDate));
                        },
                        activeColor: const Color.fromARGB(255, 44, 176, 176),
                        dayProps: const EasyDayProps(
                          borderColor: Color.fromARGB(255, 214, 214, 214),
                          height: 70,
                          inactiveDayStyle: DayStyle(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          activeDayStyle: DayStyle(
                              dayStrStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              monthStrStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              dayNumStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          todayHighlightStyle:
                              TodayHighlightStyle.withBackground,
                          todayHighlightColor:
                              Color.fromARGB(255, 189, 239, 239),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Available time",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
              SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    int hour = (index ~/ 4) + 9;
                    int minute = (index % 4) * 15;
                    String formattedHour = hour.toString().padLeft(2, '0');
                    String formattedMinute = minute.toString().padLeft(2, '0');
                    String period = hour >= 12 ? "pm" : "am";
                    if (hour > 12) {
                      hour -= 12;
                    }
                    String timeString =
                        '$formattedHour:$formattedMinute $period';

                    return BlocBuilder<NewappointmentBloc, NewappointmentState>(
                      builder: (context, state) {
                        bool isBooked = bookedTimeSlots.contains(timeString);

                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: isBooked
                              ? null
                              : () {
                                  BlocProvider.of<NewappointmentBloc>(context)
                                      .add(timepickEvent(
                                          time: timeString, index: index));
                                },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: isBooked
                                        ? const Color.fromARGB(
                                            255, 229, 228, 228)
                                        : currentindex == index
                                            ? const Color.fromARGB(
                                                255, 44, 176, 176)
                                            : const Color.fromARGB(
                                                255, 229, 228, 228)),
                                borderRadius: BorderRadius.circular(12),
                                color: isBooked
                                    ? const Color.fromARGB(95, 193, 192, 192)
                                    : currentindex == index
                                        ? const Color.fromARGB(
                                            255, 44, 176, 176)
                                        : Colors.white),
                            alignment: Alignment.center,
                            child: Text(
                              timeString,
                              style: TextStyle(
                                  fontWeight: currentindex == index
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                  color: isBooked
                                      ? const Color.fromARGB(255, 243, 241, 241)
                                      : currentindex == index
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 110, 110, 110)),
                            ),
                          ),
                        );
                      },
                    );
                  }, childCount: 13),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.75)),
              SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 16, bottom: 20),
                        child: Text(
                          "Patient details",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                      MainTextField(
                          keyboard: TextInputType.name,
                          controller: patientcontroller,
                          text: "Enter patients name",
                          preficsicon: Icons.person,
                          helpertext: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter name";
                            } else if (!name.hasMatch(value)) {
                              return "Enter a valid name";
                            } else {
                              return null;
                            }
                          }),
                      Dropdownfield(
                        preficsicon: Icons.male,
                        helpertext: "Gender",
                        validator: (value) {
                          if (value == null) {
                            return 'Please select gender.';
                          }
                          return null;
                        },
                      ),
                      MainTextField(
                          keyboard: TextInputType.number,
                          controller: agecontroller,
                          text: "Enter patients age",
                          preficsicon: Icons.calendar_month,
                          helpertext: "Age",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the age ";
                            } else if (!age.hasMatch(value)) {
                              return "Please enter a valid age";
                            } else {
                              return null;
                            }
                          }),
                      MainTextField(
                          keyboard: TextInputType.emailAddress,
                          controller: emailcontroller,
                          text: "Enter patients email",
                          preficsicon: Icons.email,
                          helpertext: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid email";
                            } else if (!regemail.hasMatch(value)) {
                              return "Please enter a valid email";
                            } else {
                              return null;
                            }
                          }),
                      MainTextField(
                          keyboard: TextInputType.phone,
                          controller: phonecontroller,
                          text: "Enter patient Phone Number",
                          preficsicon: Icons.phone_android,
                          helpertext: "Phone",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter phone number";
                            } else if (value.length > 10) {
                              return "number must be 10";
                            } else if (!phonreg.hasMatch(value)) {
                              return "Please enter a valid number";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: Mainbutton(
                          buttontext: "Confirm ",
                          onpressed: () {
                            if (formKey.currentState!.validate()) {
                              patient patientsdetails = patient(
                                  patientname: patientcontroller.text,
                                  uid: uuid,
                                  gender: gender,
                                  age: agecontroller.text,
                                  email: emailcontroller.text,
                                  phone: phonecontroller.text,
                                  time: selecttime,
                                  date: date,
                                  doctorname: widget.doctorname);
                              BlocProvider.of<NewappointmentBloc>(context).add(
                                  NewpatientEvent(
                                      patientdetails: patientsdetails));
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
