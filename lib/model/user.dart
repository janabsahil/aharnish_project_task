class User {
  String firstName;
  String lastName;
  String dob;
  String gender;
  String skills;
  String phone;
  String email;
  String password;


  User(
      {this.firstName,
        this.lastName,
        this.dob,
        this.gender,
        this.skills,
        this.phone,
        this.email,
        this.password});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    gender = json['gender'];
    skills = json['skills'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['skills'] = this.skills;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}