import 'package:hive/hive.dart';

import 'gender.dart';
part 'logged_userinfo.g.dart';

@HiveType(typeId: 1)
class LoggedUser {
  @HiveField(0)
  late String _uid;
  @HiveField(1)
  late int _age;
  @HiveField(2)
  late String _gender;
  @HiveField(3)
  late String _name;
  set setUid(String id) {
    _uid = id;
  }

  set setName(String name) {
    _name = name;
  }

  set setAge(int a) {
    _age = a;
  }

  set setGender(Gender gen) {
    _gender = gen.toString().split('.').last;
  }

  String get getUid => _uid;
  String get getName => _name;
  int get getAge => _age;
  Gender? get getGender {
    return <String, Gender>{
      'male': Gender.male,
      'female': Gender.female,
      'other': Gender.other,
    }[_gender];
  }
}
