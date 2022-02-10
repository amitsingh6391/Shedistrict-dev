class User {
  String? name;
  String? email;
  String? dob;
  String? phone;

  User({
    this.name,
    this.dob,
    this.email,
    this.phone,
  });

  User.fromDocument(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['phone'] = this.phone;

    return data;
  }
}
