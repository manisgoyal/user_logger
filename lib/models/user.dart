class User {
  late String _id;
  late String _name;
  late String _atype;

  User({required id, required name, required atype}) {
    _id = id;
    _name = name;
    _atype = atype;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        atype: json['atype'] ?? '');
  }

  String get getId => _id;
  String get getName => _name;
  String get getAcType => _atype;
}
