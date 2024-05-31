import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/controller/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:doctors_book_app/utility/constants.dart';
import 'package:doctors_book_app/view/screens/patients_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentScreenWrapper extends StatelessWidget {
  const AppointmentScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewappointmentBloc(),
      child: const AppointmetsScreen(),
    );
  }
}

class AppointmetsScreen extends StatefulWidget {
  const AppointmetsScreen({super.key});

  @override
  State<AppointmetsScreen> createState() => _AppointmetsScreenState();
}

class _AppointmetsScreenState extends State<AppointmetsScreen> {
  DateTime initialdat = DateTime.now();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewappointmentBloc>(context)
        .add(datepickEvent(date: initialdat));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewappointmentBloc, NewappointmentState>(
      listener: (context, state) {
        if (state is datepickedState) {
          initialdat = state.dates;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Appointments", style: Textstyles.pagetitlestyle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: BlocBuilder<NewappointmentBloc, NewappointmentState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(
                            DateFormat('dd-MM-yyyy').format(initialdat),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              BottomPicker.date(
                                initialDateTime: DateTime.now(),
                                buttonSingleColor: Colorpalette.primarycolor,
                                pickerTitle: Text(
                                  'Pick the date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: Colorpalette.primarycolor,
                                  ),
                                ),
                                dateOrder: DatePickerDateOrder.dmy,
                                maxDateTime: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month + 1,
                                    DateTime.now().day),
                                minDateTime: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day - 1),
                                pickerTextStyle: TextStyle(
                                  color: const Color.fromARGB(255, 0, 86, 86),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                                onChange: (index) {
                                  BlocProvider.of<NewappointmentBloc>(context)
                                      .add(datepickEvent(date: index));

                                  // print(ss);
                                },
                                onSubmit: (index) {
                                  BlocProvider.of<NewappointmentBloc>(context)
                                      .add(datepickEvent(date: index));
                                  // print(index);
                                },
                                bottomPickerTheme: BottomPickerTheme.plumPlate,
                              ).show(context);
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colorpalette.primarycolor,
                            )),
                      ],
                    );
                  },
                ),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("doctors")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const Center(
                          child:
                              //  CircularProgressIndicator(),
                              CustomLoadingAnimation(),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final doctorsdata = snapshot.data!.docs[index].data();
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PatientListWrapper(
                                            selectdate: initialdat,
                                            doctorname:
                                                doctorsdata['doctorname'],
                                          )));
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 15, bottom: 15),
                                child: Row(
                                  children: [
                                    (doctorsdata['image'] == null)
                                        ? const Expanded(
                                            flex: 1,
                                            child: CircleAvatar(
                                              child: Icon(Icons.person),
                                            ))
                                        : Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 50,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Image.network(
                                                doctorsdata['image'],
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            doctorsdata['doctorname']
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color.fromARGB(
                                                    255, 122, 118, 118)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              doctorsdata['speciality'],
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 121, 120, 120)),
                                            ),
                                          ),
                                          Text(
                                            doctorsdata['time'],
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 75, 74, 74)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colorpalette.primarycolor,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
