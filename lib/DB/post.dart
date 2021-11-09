import 'package:firebase_database/firebase_database.dart';

class Post {
  static const KEY = "key";
  static const AGE = "age";
  static const FIRST_NAME = "first_name";
  static const LAST_NAME = "last_name";
  static const GENDER = "gender";
  static const BLOOD = "blood group";
  static const LOCATION = "location";
  static const EMAIL = "email";
  static const MOBILE = "mobile";

  var age;
  var key;
  String first_name;
  String last_name;
  String gender;
  String blood_group;
  String location;
  String email;
  var mobile;

  Post(this.first_name,this.last_name, this.age, this.gender, this.blood_group, this.location,
      this.email, this.mobile);

  Post.fromSnapshot(DataSnapshot snap):
        this.key = snap.key,
        this.blood_group = snap.value[BLOOD],
        this.age = snap.value[AGE],
        this.gender = snap.value[GENDER],
        this.first_name = snap.value[FIRST_NAME],
        this.last_name = snap.value[LAST_NAME],
        this.location = snap.value[LOCATION],
        this.email = snap.value[EMAIL],
        this.mobile = snap.value[MOBILE];

  Map toMap() {
    return {
      KEY: key,
      FIRST_NAME: first_name,
      LAST_NAME: last_name,
      BLOOD: blood_group,
      AGE: age,
      GENDER: gender,
      LOCATION: location,
      EMAIL: email,
      MOBILE: mobile
    };
  }
}
