import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/utility/dummydoctors.dart';
import 'package:doctors_book_app/utility/dummydoctors.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';

part 'dummy_event.dart';
part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
final dummydata dummy=dummydata();
 final doctors = dummydata.doctorslist;
  DummyBloc() : super(DummyInitial()) {
   on<uploaddDummyEvent>(uploadDummyEvent);
  }

  Future<Uint8List> uploadingFromAssets(String path) async {
    try {
      print("333333333333333333333333");
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading imagedate: $e';
    }
  }
  
 Future<String> uploadImage(
      String path, Uint8List image, String name) async {
    try {
      print("2222222222222222222222");
      final ref = FirebaseStorage.instance.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'error getting url; $e';
    }
  }
  FutureOr<void> uploadDummyEvent(uploaddDummyEvent event, Emitter<DummyState> emit)async {
    try {
      print("1111111111111111111");
      for (var doc in doctors) {
        final file = await uploadingFromAssets(doc.image);
        final url = await uploadImage('doctors', file, doc.doctorname);
        doc.image = url;
        await FirebaseFirestore.instance
            .collection('doctors')
            .doc(doc.uid)
            .set(doc.toMap());
        emit(UploadDummystate());
      }
    } catch (e) {
      throw 'error getting url; $e';
    }
    
  }
}
