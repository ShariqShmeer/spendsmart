class SavingCategoryItems {
  final int id;
  final String iconId;
  final String title;
  final double amount;
  final double savedAmount;

  SavingCategoryItems({
    required this.id,
    required this.iconId,
    required this.title,
    required this.amount,
    required this.savedAmount,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'iconId': iconId,
      'title': title,
      'id': id,
      'amount': amount,
      'savedAmount': savedAmount,
    };
  }

  // Create from JSON
  factory SavingCategoryItems.fromJson(Map<String, dynamic> json) {
    return SavingCategoryItems(
      iconId: json['iconId'],
      title: json['title'],
      id: json['id'],
      savedAmount: json['savedAmount'],
      amount: json['amount'],
    );
  }
}
