import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/model/patients_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'new_appointment_event.dart';
part 'new_appointment_state.dart';

class NewappointmentBloc
    extends Bloc<NewappointmentEvent, NewappointmentState> {
  final user = FirebaseAuth.instance.currentUser;
  NewappointmentBloc() : super(NewappointmentInitial()) {
    on<timepickEvent>((event, emit) {
      emit(timepickedState(times: event.time, index: event.index));
    });
    on<datepickEvent>((event, emit) {
      emit(datepickedState(dates: event.date));
    });

    on<NewpatientEvent>((event, emit) {
      emit(NewpatientloadingState());
      try {

        patient patients = patient(
            patientname: event.patientdetails.patientname,
            uid: event.patientdetails.uid,
            gender: event.patientdetails.gender,
            age: event.patientdetails.age,
            email: event.patientdetails.email,
            phone: event.patientdetails.phone,
            time: event.patientdetails.time,
            date: event.patientdetails.date,
            doctorname: event.patientdetails.doctorname);

        FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .collection("patients")
            .doc(patients.uid)
            .set(patients.toMap());

        emit(NewpatientSuccessState(patientdetails: patients));
      } catch (e) {
        emit(NewpatientErrorState(msg: e.toString()));
      }
    });
    on<DropdowngenderEvent>((event, emit) {
      emit(DropdowngenderState(gender: event.selectgender));
    });
    on<Cancelappointment>((event, emit)async {
      emit(Cancelappointmentloading());
      try {
      await  FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .collection("patients")
            .doc(event.uuid)
            .delete();
            
          emit(Cancelappointmentsuccess());
      } catch (e) {
      
        emit(Cancelappointmenterror());
      }
    });
  }
}
