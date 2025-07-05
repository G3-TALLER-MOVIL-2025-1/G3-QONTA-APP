class ProfileData {
  final String email;
  final String fullname;
  final String amount;
  final String date;
  

  

  // const Transaction({
  //   required this.amount,
  //   required this.category,
  //   required this.description,
  // });
  const ProfileData({
    required this.email,
    required this.fullname,
    required this.amount,
    required this.date,
  });
  // factory ProfileData.fromJson(Map<String, dynamic> json){
  //     return ProfileData(
  //     email: json['email'] ?? '',
  //     fullname: json['fullname'] ?? '',
  //     amount: json['amount'] ?? '',
  //     date: json['date'] ?? '',
  //     // name: json['name'] ?? '',
  //     // lastname: json['lastname'] ?? '',      
  //   );
  // }
  factory ProfileData.fromJson(List<dynamic> json){
      return ProfileData(
      email: json[0]['email'] ?? '',
      fullname: json[0]['fullname'] ?? '',
      amount: json[0]['amount'] ?? '',
      date: json[0]['date'] ?? '',
      // name: json['name'] ?? '',
      // lastname: json['lastname'] ?? '',      
    );
  }
  // static Transaction fromJson(json) => Transaction(
  //   // amount: double.parse(json["amount"]),
  //   // date: DateTime.parse(json["date"]),
  //   // state: json["state"],
  //   amount: json["amount"],
  //   category: json["categoryname"],
  //   description: json["description"],
  // );
  // static Transaction fromJson(json) { 
  //   var datetime = DateTime.parse(json["date"]);
  //   return Transaction(
  //   amount: json["amount"],
  //   date: "${datetime.day}-${datetime.month}-${datetime.year}",
  //   state: json["state"],
  //   );
  // }
}