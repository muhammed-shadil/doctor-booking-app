// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'newappointment_bloc.dart';

sealed class NewappointmentState {}

final class NewappointmentInitial extends NewappointmentState {}

class timepickedState extends NewappointmentState {
  final String times;
  final int index;
  timepickedState({
    required this.times,
    required this.index,
  });
}

class datepickedState extends NewappointmentState {
  final DateTime dates;
  datepickedState({
    required this.dates,
  });
}

class NewpatientloadingState extends NewappointmentState {}

class NewpatientSuccessState extends NewappointmentState {final patient patientdetails;

  NewpatientSuccessState({required this.patientdetails});}

class NewpatientErrorState extends NewappointmentState {
  String msg;
  NewpatientErrorState({
    required this.msg,
  });
}
class DropdowngenderState extends NewappointmentState {
  final String gender;
  DropdowngenderState({
    required this.gender,
  });
}
