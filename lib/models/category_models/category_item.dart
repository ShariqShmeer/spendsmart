import 'package:flutter/cupertino.dart';

class CategoryItem {
  final int id;
  final IconData iconData;
  final String title;

  CategoryItem({required this.id, required this.iconData, required this.title});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'iconData': iconData.codePoint,
      'title': title,
      'id': id,
    };
  }

  // Create from JSON
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      iconData: IconData(json['iconData'], fontFamily: 'MaterialIcons'),
      title: json['title'],
      id: json['id'],
    );
  }
}
