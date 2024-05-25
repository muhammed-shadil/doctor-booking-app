// ignore_for_file: public_member_api_docs, sort_constructors_first

class patient {
  String? patientname;
  String? uid;
  String? gender;
  String? age;
  String? email;
  String? phone;
  String? time;
  DateTime? date;
  String? doctorname;
  patient({
    this.patientname,
    this.uid,
    this.gender,
    this.age,
    this.email,
    this.phone,
    this.time,
    this.date,
    this.doctorname,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patientname': patientname,
      'uid': uid,
      'gender': gender,
      'age': age,
      'email': email,
      'phone': phone,
      'time': time,
      'date': date,
      'doctorname': doctorname,
    };
  }

  factory patient.fromMap(Map<String, dynamic> map) {
    return patient(
      patientname: map['patientname'] as String,
      uid: map['uid'] as String,
      gender: map['gender'] as String,
      age: map['age'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      time: map['time'] as String,
      date: map['date'],
      doctorname: map['doctorname'] as String,
    );
  }
}
