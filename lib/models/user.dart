class User{
  final String email;
  final String password;
  final int usersid;
  // final String? name;
  // final String? lastname;

  User({
    required this.usersid,
    required this.email,
    required this.password,
    // required this.name,
    // required this.lastname,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      usersid: json['usersid'] ?? '',
      email: json['email'] ?? '',
      password: json['passwordhash'] ?? '',
      // name: json['name'] ?? '',
      // lastname: json['lastname'] ?? '',      
    );
  }

  // static User fromJson(json) => User(
  //     email: json['email'] ?? '',
  //     password: json['password'] ?? '',
  // );


}