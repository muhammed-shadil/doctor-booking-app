// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'newappointment_bloc.dart';

sealed class NewappointmentEvent {}

class datepickEvent extends NewappointmentEvent {
  final DateTime date;
  datepickEvent({
    required this.date,
  });
}

class timepickEvent extends NewappointmentEvent {
  final String time;
  final int index;
  timepickEvent({
    required this.time,
    required this.index,
  });
}

class NewpatientEvent extends NewappointmentEvent {
  final patient patientdetails;
  NewpatientEvent({
    required this.patientdetails,
  });
}

class DropdowngenderEvent extends NewappointmentEvent {
  final String selectgender;
  DropdowngenderEvent({
    required this.selectgender,
  });
 
}
 class Cancelappointment extends NewappointmentEvent{
  final String uuid;

  Cancelappointment({required this.uuid});
 }