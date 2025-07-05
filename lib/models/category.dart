class Category {
  String categoryId;
  String? categoryName;
  // String description;
  // String? date = "";
  

  // const Transaction({
  //   required this.amount,
  //   required this.category,
  //   required this.description,
  // });
  Category({
    required this.categoryId,
    required this.categoryName,
    // required this.description,
    // this.date = 'afds',
  });
  factory Category.fromJson(Map<String, dynamic> json){
      return Category(
      categoryId: json['categoriesId'].toString() ?? '',
      categoryName: json['categoryName'] ?? '',
      // description: json['description'] ?? '',
      // date: json['date'] ?? '',
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