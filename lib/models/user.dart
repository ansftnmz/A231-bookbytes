class User {
  String? userid;
  String? useremail;
  String? username;
  String? userpass;
  String? userdatereg;

  User(
      {this.userid,
      this.useremail,
      this.username,
      this.userpass,
      this.userdatereg});

  User.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    useremail = json['useremail'];
    username = json['username'];
    userpass = json['userpass'];
    userdatereg = json['userdatereg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['useremail'] = useremail;
    data['username'] = username;
    data['userpass'] = userpass;
    data['userdatereg'] = userdatereg;
    return data;
  }
}