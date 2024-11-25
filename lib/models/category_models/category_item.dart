class CategoryItem {
  final int id;
  final String iconId;
  final String title;
  final double amount;
  final CategoryType categoryType;

  CategoryItem({
    required this.id,
    required this.iconId,
    required this.title,
    required this.amount,
    required this.categoryType,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'iconId': iconId,
      'title': title,
      'id': id,
      'amount': amount,
      'categoryType': categoryType.toString().split('.').last,
    };
  }

  // Create from JSON
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      iconId: json['iconId'],
      title: json['title'],
      id: json['id'],
      categoryType: CategoryType.values.firstWhere(
          (type) => type.toString() == 'CategoryType..${json['categoryType']}'),
      amount: json['amount'],
    );
  }
}

enum CategoryType {
  expense,
  income,
}
