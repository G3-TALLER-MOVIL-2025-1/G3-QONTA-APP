class Transaction {
  final double amount;
  final String date;
  final String state;

  

  const Transaction({
    required this.amount,
    required this.date,
    required this.state,
  });

  static Transaction fromJson(json) => Transaction(
    // amount: double.parse(json["amount"]),
    // date: DateTime.parse(json["date"]),
    // state: json["state"],
    amount: json["amount"],
    date: json["date"],
    state: json["state"],
  );
  // static Transaction fromJson(json) { 
  //   var datetime = DateTime.parse(json["date"]);
  //   return Transaction(
  //   amount: json["amount"],
  //   date: "${datetime.day}-${datetime.month}-${datetime.year}",
  //   state: json["state"],
  //   );
  // }
}