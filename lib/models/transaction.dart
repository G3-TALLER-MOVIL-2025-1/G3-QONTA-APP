class Transaction {
  final String amount;
  final String category;
  final String description;

  

  // const Transaction({
  //   required this.amount,
  //   required this.category,
  //   required this.description,
  // });
  const Transaction({
    required this.amount,
    required this.category,
    required this.description,
  });
  factory Transaction.fromJson(Map<String, dynamic> json){
      return Transaction(
      amount: json['amount'] ?? '',
      category: json['categoryname'] ?? '',
      description: json['description'] ?? '',
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