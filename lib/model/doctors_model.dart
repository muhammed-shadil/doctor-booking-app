// ignore_for_file: public_member_api_docs, sort_constructors_first
class doctorsmodel {
  String doctorname;
  String image;
  String uid;
  String nopatients;
  String experince;
  String qualifications;
  String speciality;
  String about;
  String time;
  doctorsmodel({
    required this.doctorname,
    required this.image,
    required this.uid,
    required this.nopatients,
    required this.experince,
    required this.qualifications,
    required this.speciality,
    required this.about,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'doctorname': doctorname,
      'image': image,
      'uid': uid,
      'nopatients': nopatients,
      'experince': experince,
      'qualifications': qualifications,
      'speciality': speciality,
      'about': about,
      'time': time,
    };
  }

  factory doctorsmodel.fromMap(Map<String, dynamic> map) {
    return doctorsmodel(
      doctorname: map['doctorname'] as String,
      image: map['image'] as String,
      uid: map['uid'] as String,
      nopatients: map['nopatients'] as String,
      experince: map['experince'] as String,
      qualifications: map['qualifications'] as String,
      speciality: map['speciality'] as String,
      about: map['about'] as String,
      time: map['time'] as String,
    );
  }
}
