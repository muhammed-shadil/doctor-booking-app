import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/view/widgets/mainbutton.dart';
import 'package:doctors_book_app/view/widgets/successpop.dart';
import 'package:doctors_book_app/view/widgets/textfield.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class NewAppointmentScreen extends StatefulWidget {
  NewAppointmentScreen({super.key, this.currentindex});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
  int? currentindex = 0;
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  TextEditingController patientcontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 241),
      body: SafeArea(
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
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "New Appointment",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 118, 115, 115)),
                        ),
                      )
                    ],
                  ),
                  // EasyDateTimeLine(
                  //   initialDate: DateTime.now(),
                  //   onDateChange: (selectedDate) {
                  //     //`selectedDate` the new date selected.
                  //   },
                  //   headerProps: const EasyHeaderProps(
                  //     monthPickerType: MonthPickerType.switcher,
                  //     dateFormatter: DateFormatter.fullDateDMY(),
                  //   ),
                  //   dayProps: const EasyDayProps(
                  //     height: 60,
                  //     dayStructure: DayStructure.dayStrDayNum,
                  //     activeDayStyle: DayStyle(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(8)),
                  //         gradient: LinearGradient(
                  //           begin: Alignment.topCenter,
                  //           end: Alignment.bottomCenter,
                  //           colors: [
                  //             Color(0xff3371FF),
                  //             Color(0xff8426D6),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
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
                      todayHighlightStyle: TodayHighlightStyle.withBackground,
                      todayHighlightColor: Color.fromARGB(255, 189, 239, 239),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Available time",
                      style: TextStyle(fontSize: 20),
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
                String timeString = '$formattedHour:$formattedMinute $period';

                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      widget.currentindex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: widget.currentindex == index
                                ? const Color.fromARGB(255, 44, 176, 176)
                                : Color.fromARGB(255, 229, 228, 228)),
                        borderRadius: BorderRadius.circular(12),
                        color: widget.currentindex == index
                            ? const Color.fromARGB(255, 44, 176, 176)
                            : Colors.white),
                    alignment: Alignment.center,
                    child: Text(
                      // "${Index + 9}:00 ${Index + 9 > 11 ? "pm" : "am"}",
                      timeString,
                      style: TextStyle(
                          fontWeight: widget.currentindex == index
                              ? FontWeight.bold
                              : FontWeight.w400,
                          color: widget.currentindex == index
                              ? Colors.white
                              : const Color.fromARGB(255, 110, 110, 110)),
                    ),
                  ),
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
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 16, bottom: 20),
                    child: Text(
                      "Patient details",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  MainTextField(
                      controller: patientcontroller,
                      text: "Enter patients name",
                      preficsicon: Icons.person,
                      helpertext: "Name",
                      validator: (_) {}),
                  MainTextField(
                      controller: gendercontroller,
                      text: "please select your gender",
                      preficsicon: Icons.male,
                      helpertext: "Gender",
                      validator: (_) {}),
                  MainTextField(
                      controller: agecontroller,
                      text: "Enter patients age",
                      preficsicon: Icons.calendar_month,
                      helpertext: "Age",
                      validator: (_) {}),
                  MainTextField(
                      controller: emailcontroller,
                      text: "Enter patients email",
                      preficsicon: Icons.email,
                      helpertext: "Email",
                      validator: (_) {}),
                  MainTextField(
                      controller: phonecontroller,
                      text: "Enter patient Phone Number",
                      preficsicon: Icons.phone_android,
                      helpertext: "Phone",
                      validator: (_) {}),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: Mainbutton(
                      buttontext: "Confirm ",
                      onpressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => Successpop(
                                msg: "Your appointment booking successfully scheduled.",
                                icon: FontAwesomeIcons.checkToSlot,
                                // Icons.file_download_done_sharp,
                                iconColor:
                                    const Color.fromARGB(255, 44, 176, 176),
                                onConfirm: () { Navigator.pop(context);},
                                onReject: () {
                                 
                                }));
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
    );
  }
}
